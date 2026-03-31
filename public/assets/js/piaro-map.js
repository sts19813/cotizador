/*************************************************
 * MAPAS DE ESTADO
 *************************************************/
const statusMap = {
    for_sale: "Disponible",
    sold: "Vendido",
    reserved: "Apartado",
    locked_sale: "Bloqueado"
};

const statusColors = {
    for_sale: 'rgba(52, 199, 89, 0.7)',
    sold: 'rgba(200, 0, 0, 0.6)',
    reserved: 'rgba(255, 200, 0, 0.6)',
    locked_sale: 'rgba(120,120,120,.9)'
};

const DEVELOPMENT_TREE = [
    { id: 33, name: 'Piaró' },
    { id: 43, name: 'Paseo Península' },
    {
        id: 3,
        name: 'Ahawell',
        children: [
            { id: 2, name: 'Portal' },
            { id: 14, name: 'Chakté' },
            { id: 8, name: 'Bayal' },
            { id: 9, name: 'Pakal' },
            { id: 10, name: 'Chechem' }
        ]
    }
];

let isSelectingLot = false;
let currentDevelopment = null;
let currentMap = [];
let lotsByDevelopment = {};

function resolveMediaUrl(path) {
    if (!path) return '';
    if (/^https?:\/\//i.test(path)) return path;
    const cleanPath = String(path).replace(/^\/+/, '');
    return `${window.NABOO_ASSET_BASE_URL}/${cleanPath}`;
}

function getSelectedLotLabel(lot) {
    const lotName = lot?.name ?? lot?.lote_id ?? '';
    if (!currentDevelopment) {
        return lotName;
    }

    return `${currentDevelopment.name} - Lote ${lotName}`;
}

/*************************************************
 * RENDER CARD LOTE SELECCIONADO
 *************************************************/
function renderSelectedLot(lot) {
    document.getElementById('lotTitle').textContent = 'Lote seleccionado';
    document.getElementById('lotName').textContent = getSelectedLotLabel(lot);
    document.getElementById('lotArea').textContent = `${lot.area} m²`;

    document.getElementById('lotPriceM2').textContent =
        `$${Number(lot.price_square_meter).toLocaleString()}`;
    document.getElementById('lotTotal').textContent =
        `$${Number(lot.area * lot.price_square_meter).toLocaleString()}`;

    document.getElementById('piaroInitialContent').classList.add('d-none');

    if (!isSelectingLot) {
        document.getElementById('info-lote').classList.remove('d-none');
    } else {
        document.getElementById('info-lote').classList.add('d-none');
    }

    document.getElementById('selectedLotCard').classList.remove('d-none');
}

function setDevelopmentButtons() {
    const container = document.getElementById('developmentSelector');
    if (!container) return;

    container.innerHTML = '';

    DEVELOPMENT_TREE.forEach(dev => {
        const group = document.createElement('div');
        group.className = 'development-group mb-2';

        const mainBtn = document.createElement('button');
        mainBtn.type = 'button';
        mainBtn.className = 'btn btn-outline-primary btn-sm me-2 mb-2 development-btn';
        mainBtn.textContent = dev.name;
        mainBtn.dataset.developmentId = dev.id;
        mainBtn.dataset.buttonType = 'main';

        if (!dev.children) {
            mainBtn.addEventListener('click', () => loadDevelopment(dev.id));
            group.appendChild(mainBtn);
        } else {
            mainBtn.addEventListener('click', () => loadDevelopment(dev.id));
            group.appendChild(mainBtn);

            const subContainer = document.createElement('div');
            subContainer.className = 'd-flex flex-wrap gap-2 ms-0 ms-md-3';

            dev.children.forEach(child => {
                const childBtn = document.createElement('button');
                childBtn.type = 'button';
                childBtn.className = 'btn btn-light btn-sm development-btn';
                childBtn.textContent = child.name;
                childBtn.dataset.developmentId = child.id;
                childBtn.dataset.buttonType = 'child';
                childBtn.addEventListener('click', () => loadDevelopment(child.id));
                subContainer.appendChild(childBtn);
            });

            group.appendChild(subContainer);
        }

        container.appendChild(group);
    });
}

function highlightActiveDevelopment(id) {
    document.querySelectorAll('.development-btn').forEach(btn => {
        const isActive = Number(btn.dataset.developmentId) === Number(id);
        const isMain = btn.dataset.buttonType === 'main';

        btn.classList.remove('btn-primary', 'btn-outline-primary', 'btn-light');
        btn.classList.add(isActive ? 'btn-primary' : (isMain ? 'btn-outline-primary' : 'btn-light'));
        btn.classList.toggle('active', isActive);
    });
}

async function fetchDevelopment(id) {
    const response = await fetch(`${window.DESARROLLOS_API_URL}/${id}`);
    if (!response.ok) {
        throw new Error(`No se pudo cargar el desarrollo ${id}`);
    }
    return response.json();
}

async function fetchLotsForStage(stageId) {
    if (!stageId) return [];

    if (lotsByDevelopment[stageId]) {
        return lotsByDevelopment[stageId];
    }

    const response = await fetch(`${window.LOTS_API_URL}?stage_id=${stageId}`);
    if (!response.ok) {
        throw new Error(`No se pudieron cargar lotes para stage ${stageId}`);
    }

    const lots = await response.json();
    lotsByDevelopment[stageId] = lots;
    return lots;
}

function renderMapAssets(development) {
    const mapBase = document.getElementById('dynamicMapBase');
    const svgLayer = document.getElementById('dynamicSvgLayer');
    const modalTitle = document.getElementById('developmentModalTitle');

    if (!mapBase || !svgLayer || !modalTitle) return;

    mapBase.src = resolveMediaUrl(development.png_image);
    mapBase.alt = `Masterplan ${development.name}`;
    modalTitle.textContent = development.name;

    svgLayer.innerHTML = '';
}

async function loadSvgLayer(development) {
    const svgLayer = document.getElementById('dynamicSvgLayer');
    const svgUrl = resolveMediaUrl(development.svg_image);

    if (!svgUrl || !svgLayer) return;

    try {
        const proxyUrl = `/svg-proxy?url=${encodeURIComponent(svgUrl)}`;

        const response = await fetch(proxyUrl);

        if (!response.ok) {
            throw new Error('No se pudo cargar el SVG');
        }

        const svgText = await response.text();
        svgLayer.innerHTML = svgText;

    } catch (error) {
        console.error(error);
    }
}
function getMappedLot(item, lotsCache) {
    return lotsCache.find(l =>
        String(l.id) === String(item.lote_id) ||
        String(l.id_lote) === String(item.lote_id) ||
        String(l.name) === String(item.lote_id)
    );
}

function bindSvgInteractions(svgLayer, lotsCache, input, hiddenLotId) {
    currentMap.forEach(item => {
        if (!item.selectorSVG || !item.lote_id) return;

        const matchedLot = getMappedLot(item, lotsCache);
        if (!matchedLot) return;

        const svgElement = svgLayer.querySelector(`#${item.selectorSVG}`);
        if (!svgElement) return;

        const status = matchedLot.status;
        const fillColor = statusColors[status] ?? 'rgba(100,100,100,.8)';
        const isSelectable = status === 'for_sale';

        paintSvg(svgElement, fillColor);

        svgElement.style.cursor = isSelectable ? 'pointer' : 'not-allowed';

        new bootstrap.Tooltip(svgElement, {
            html: true,
            title: `
                Lote ${matchedLot.name}<br>
                ${statusMap[status]}<br>
                Área: ${matchedLot.area} m²
            `
        });

        if (!isSelectable) return;

        svgElement.addEventListener('mouseenter', () => {
            paintSvg(svgElement, 'rgba(0,120,255,.8)');
        });

        svgElement.addEventListener('mouseleave', () => {
            paintSvg(svgElement, fillColor);
        });

        svgElement.addEventListener('click', e => {
            e.preventDefault();

            isSelectingLot = false;
            window.selectedLote = matchedLot;

            clearSelectedLot();

            const loteTotal = matchedLot.area * matchedLot.price_square_meter;

            selections.lote = {
                id: matchedLot.id,
                name: getSelectedLotLabel(matchedLot),
                lot_name: matchedLot.name,
                development_id: currentDevelopment.id,
                development_name: currentDevelopment.name,
                area: matchedLot.area,
                price_square_meter: matchedLot.price_square_meter,
                total: loteTotal,
                origen: 'svg',
                suma: true
            };

            localStorage.setItem('selections', JSON.stringify(selections));
            recalcularPrecioTotal();

            input.value = matchedLot.name;
            hiddenLotId.value = matchedLot.id;

            renderSelectedLot(matchedLot);

            const modalEl = document.getElementById('modalPiaro');
            const modal = bootstrap.Modal.getInstance(modalEl);
            if (modal) modal.hide();
        });
    });
}

async function loadDevelopment(developmentId) {
    const input = document.getElementById('lotInput');
    const hiddenLotId = document.getElementById('lotId');
    const svgLayer = document.getElementById('dynamicSvgLayer');

    try {
        const development = await fetchDevelopment(developmentId);
        currentDevelopment = development;
        currentMap = development.map || development.lotes || [];

        renderMapAssets(development);
        await loadSvgLayer(development);

        const lots = await fetchLotsForStage(development.stage_id);
        window.lotsCache = lots;

        bindSvgInteractions(svgLayer, lots, input, hiddenLotId);
        highlightActiveDevelopment(developmentId);
    } catch (error) {
        console.error(error);
    }
}

/*************************************************
 * DOM READY
 *************************************************/
document.addEventListener('DOMContentLoaded', function () {
    const input = document.getElementById('lotInput');
    const dropdown = document.getElementById('lotDropdown');
    const hiddenLotId = document.getElementById('lotId');
    const changeLotBtn = document.getElementById('changeLotBtn');

    setDevelopmentButtons();
    loadDevelopment(33);

    input.addEventListener('input', function () {
        const allowedStatuses = ['sold', 'reserved'];
        const value = this.value.toLowerCase().trim();
        dropdown.innerHTML = '';

        if (!value || !Array.isArray(window.lotsCache)) {
            dropdown.style.display = 'none';
            return;
        }

        const matches = window.lotsCache.filter(l =>
            allowedStatuses.includes(l.status) &&
            String(l.name).toLowerCase().includes(value)
        );

        if (!matches.length) {
            dropdown.style.display = 'none';
            return;
        }

        matches.forEach(lot => {
            const item = document.createElement('button');
            item.type = 'button';
            item.className = 'list-group-item list-group-item-action';
            item.innerHTML = `<strong>Lote ${lot.name}</strong>`;
            isSelectingLot = false;

            item.onclick = () => {
                isSelectingLot = true;
                input.value = lot.name;
                hiddenLotId.value = lot.id;
                dropdown.style.display = 'none';

                window.selectedLote = lot;
                clearSelectedLot();

                selections.lote = {
                    id: lot.id,
                    name: getSelectedLotLabel(lot),
                    lot_name: lot.name,
                    development_id: currentDevelopment?.id,
                    development_name: currentDevelopment?.name,
                    area: lot.area,
                    price_square_meter: lot.price_square_meter,
                    total: lot.area * lot.price_square_meter,
                    origen: 'input',
                    suma: false
                };
                localStorage.setItem('selections', JSON.stringify(selections));

                renderSelectedLot(lot);
            };
            dropdown.appendChild(item);
        });

        dropdown.style.display = 'block';
    });

    document.addEventListener('click', e => {
        if (!e.target.closest('.position-relative')) {
            dropdown.style.display = 'none';
        }
    });

    if (changeLotBtn) {
        changeLotBtn.onclick = () => {
            clearSelectedLot();
            document.getElementById('selectedLotCard').classList.add('d-none');
            document.getElementById('piaroInitialContent').classList.remove('d-none');
            input.value = '';
            hiddenLotId.value = '';
            window.selectedLote = null;
        };
    }
});

function clearSelectedLot() {
    if (selections['lote']) {
        delete selections['lote'];
        localStorage.setItem('selections', JSON.stringify(selections));
        recalcularPrecioTotal();
    }
}

function paintSvg(el, color) {
    if (!el) return;

    el.style.setProperty('fill', color, 'important');
    el.querySelectorAll('*').forEach(child =>
        child.style.setProperty('fill', color, 'important')
    );
}
