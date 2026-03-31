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
let searchableLotsCache = [];

function resolveMediaUrl(path) {
    if (!path) return '';
    if (/^https?:\/\//i.test(path)) return path;
    const cleanPath = String(path).replace(/^\/+/, '');
    return `${window.NABOO_ASSET_BASE_URL}/${cleanPath}`;
}

function getSelectedLotLabel(lot, developmentName = null) {
    const lotName = lot?.name ?? lot?.lote_id ?? '';
    const resolvedDevelopmentName = developmentName || lot?.development_name || currentDevelopment?.name;

    if (!resolvedDevelopmentName) {
        return lotName;
    }

    return `${resolvedDevelopmentName} - Lote ${lotName}`;
}

/*************************************************
 * RENDER CARD LOTE SELECCIONADO
 *************************************************/
function renderSelectedLot(lot, developmentName = null) {
    document.getElementById('lotTitle').textContent = 'Lote seleccionado';
    document.getElementById('lotName').textContent = getSelectedLotLabel(lot, developmentName);
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
        group.className = 'development-group w-100 mb-2';

        const card = document.createElement('div');
        card.className = 'development-card';
        card.dataset.developmentId = dev.id;

        const mainBtn = document.createElement('button');
        mainBtn.type = 'button';
        mainBtn.className = 'btn development-btn development-main-btn';
        mainBtn.dataset.developmentId = dev.id;
        mainBtn.dataset.buttonType = 'main';

        if (dev.children?.length) {
            mainBtn.dataset.bsToggle = 'collapse';
            mainBtn.dataset.bsTarget = `#developmentChildren-${dev.id}`;
            mainBtn.setAttribute('aria-expanded', 'false');
            mainBtn.setAttribute('aria-controls', `developmentChildren-${dev.id}`);
        }

        const mainContent = document.createElement('span');
        mainContent.className = 'development-main-content';
        mainContent.innerHTML = `<span class="development-name">${dev.name}</span>`;

        const icon = document.createElement('span');
        icon.className = 'development-icon';
        icon.innerHTML = dev.children?.length ? '+' : '';

        mainBtn.appendChild(mainContent);
        mainBtn.appendChild(icon);

        if (!dev.children?.length) {
            mainBtn.addEventListener('click', () => loadDevelopment(dev.id));
        } else {
            mainBtn.addEventListener('click', () => {
                setTimeout(() => {
                    const collapseEl = document.getElementById(`developmentChildren-${dev.id}`);
                    const isOpen = collapseEl?.classList.contains('show');
                    icon.textContent = isOpen ? '−' : '+';

                    if (!isOpen) {
                        loadDevelopment(dev.id);
                    }
                }, 0);
            });

            const subContainer = document.createElement('div');
            subContainer.id = `developmentChildren-${dev.id}`;
            subContainer.className = 'collapse development-children';

            const childButtons = document.createElement('div');
            childButtons.className = 'development-children-buttons';

            dev.children.forEach(child => {
                const childBtn = document.createElement('button');
                childBtn.type = 'button';
                childBtn.className = 'btn btn-light btn-sm development-btn';
                childBtn.textContent = child.name;
                childBtn.dataset.developmentId = child.id;
                childBtn.dataset.buttonType = 'child';
                childBtn.addEventListener('click', event => {
                    event.stopPropagation();
                    loadDevelopment(child.id);
                });
                childButtons.appendChild(childBtn);
            });

            subContainer.appendChild(childButtons);
            card.appendChild(mainBtn);
            card.appendChild(subContainer);
            group.appendChild(card);
            container.appendChild(group);
            return;
        }

        card.appendChild(mainBtn);
        group.appendChild(card);
        container.appendChild(group);
    });
}

function highlightActiveDevelopment(id) {
    const numericId = Number(id);

    document.querySelectorAll('.development-btn').forEach(btn => {
        const isActive = Number(btn.dataset.developmentId) === numericId;
        const isMain = btn.dataset.buttonType === 'main';

        if (isMain) {
            btn.classList.toggle('active', isActive);
            return;
        }

        btn.classList.toggle('btn-primary', isActive);
        btn.classList.toggle('text-white', isActive);
        btn.classList.toggle('btn-light', !isActive);
    });

    DEVELOPMENT_TREE.forEach(dev => {
        if (!dev.children?.length) return;

        const collapseEl = document.getElementById(`developmentChildren-${dev.id}`);
        const toggleBtn = document.querySelector(`.development-main-btn[data-development-id="${dev.id}"]`);
        const icon = toggleBtn?.querySelector('.development-icon');

        if (!collapseEl || !toggleBtn) return;

        const shouldOpen = Number(dev.id) === numericId || dev.children.some(child => Number(child.id) === numericId);
        const collapse = bootstrap.Collapse.getOrCreateInstance(collapseEl, { toggle: false });

        if (shouldOpen) {
            collapse.show();
            icon && (icon.textContent = '−');
            toggleBtn.classList.add('active');
        } else {
            collapse.hide();
            icon && (icon.textContent = '+');
            toggleBtn.classList.remove('active');
        }
    });
}

async function fetchDevelopment(id) {
    const response = await fetch(`${window.DESARROLLOS_API_URL}/${id}`);
    if (!response.ok) {
        throw new Error(`No se pudo cargar el desarrollo ${id}`);
    }
    return response.json();
}

function flattenDevelopments(tree) {
    return tree.flatMap(dev => dev.children?.length ? [dev, ...dev.children] : [dev]);
}

async function preloadSearchableLots() {
    const flatDevelopments = flattenDevelopments(DEVELOPMENT_TREE);

    const developmentData = await Promise.all(flatDevelopments.map(async dev => {
        const development = await fetchDevelopment(dev.id);
        const lots = await fetchLotsForStage(development.stage_id);

        return lots.map(lot => ({
            ...lot,
            development_id: development.id,
            development_name: development.name,
            stage_id: development.stage_id
        }));
    }));

    searchableLotsCache = developmentData.flat();
}

function resolveSearchLots() {
    if (!currentDevelopment) return searchableLotsCache;

    const ahawell = DEVELOPMENT_TREE.find(dev => Number(dev.id) === 3);
    if (Number(currentDevelopment.id) === 3 && ahawell?.children?.length) {
        const childIds = ahawell.children.map(child => Number(child.id));
        return searchableLotsCache.filter(lot => childIds.includes(Number(lot.development_id)));
    }

    return searchableLotsCache.filter(lot => Number(lot.development_id) === Number(currentDevelopment.id));
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
        window.lotsCache = lots.map(lot => ({
            ...lot,
            development_id: development.id,
            development_name: development.name
        }));

        bindSvgInteractions(svgLayer, window.lotsCache, input, hiddenLotId);
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
    preloadSearchableLots().catch(error => console.error(error));

    input.addEventListener('input', function () {
        const allowedStatuses = ['sold', 'reserved'];
        const value = this.value.toLowerCase().trim();
        dropdown.innerHTML = '';

        const scopedLots = resolveSearchLots();

        if (!value || !Array.isArray(scopedLots) || !scopedLots.length) {
            dropdown.style.display = 'none';
            return;
        }

        const matches = scopedLots.filter(l =>
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
            const developmentLabel = lot.development_name ? `<small class="text-muted d-block">${lot.development_name}</small>` : '';
            item.innerHTML = `${developmentLabel}<strong>Lote ${lot.name}</strong>`;
            isSelectingLot = false;

            item.onclick = () => {
                isSelectingLot = true;
                input.value = lot.development_name ? `${lot.development_name} - Lote ${lot.name}` : lot.name;
                hiddenLotId.value = lot.id;
                dropdown.style.display = 'none';

                window.selectedLote = lot;
                clearSelectedLot();

                selections.lote = {
                    id: lot.id,
                    name: getSelectedLotLabel(lot, lot.development_name),
                    lot_name: lot.name,
                    development_id: lot.development_id || currentDevelopment?.id,
                    development_name: lot.development_name || currentDevelopment?.name,
                    area: lot.area,
                    price_square_meter: lot.price_square_meter,
                    total: lot.area * lot.price_square_meter,
                    origen: 'input',
                    suma: false
                };
                localStorage.setItem('selections', JSON.stringify(selections));

                renderSelectedLot(lot, lot.development_name);
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
