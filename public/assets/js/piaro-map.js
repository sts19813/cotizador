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
let activeSearchDevelopmentId = 33;
let selectedModalRootDevelopmentId = 33;

const AHAWELL_ROOT_ID = 3;

function getInputElementsForDevelopment(developmentId) {
    return {
        input: document.getElementById(`lotInput-${developmentId}`),
        hiddenLotId: document.getElementById(`lotId-${developmentId}`),
        dropdown: document.getElementById(`lotDropdown-${developmentId}`)
    };
}

function setActiveSearchDevelopment(developmentId) {
    activeSearchDevelopmentId = Number(developmentId);
}

function getActiveInputElements() {
    return getInputElementsForDevelopment(activeSearchDevelopmentId);
}

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

function setDevelopmentButtons(rootDevelopmentId) {
    const container = document.getElementById('developmentSelector');
    if (!container) return;

    container.innerHTML = '';
    const numericRootId = Number(rootDevelopmentId);

    if (numericRootId !== AHAWELL_ROOT_ID) {
        container.classList.add('d-none');
        return;
    }

    const ahawell = DEVELOPMENT_TREE.find(dev => Number(dev.id) === AHAWELL_ROOT_ID);
    if (!ahawell?.children?.length) {
        container.classList.add('d-none');
        return;
    }

    container.classList.remove('d-none');

    const childButtons = document.createElement('div');
    childButtons.className = 'development-selector-cluster';

    ahawell.children.forEach(child => {
        const childBtn = document.createElement('button');
        childBtn.type = 'button';
        childBtn.className = 'btn btn-sm development-btn development-child-btn';
        childBtn.textContent = child.name;
        childBtn.dataset.developmentId = child.id;
        childBtn.addEventListener('click', () => loadDevelopment(child.id));
        childButtons.appendChild(childBtn);
    });

    container.appendChild(childButtons);
}

function highlightActiveDevelopment(id) {
    const numericId = Number(id);

    document.querySelectorAll('.development-btn').forEach(btn => {
        const isActive = Number(btn.dataset.developmentId) === numericId;
        btn.classList.toggle('active', isActive);
        btn.classList.toggle('btn-primary', isActive);
        btn.classList.toggle('text-white', isActive);
        btn.classList.toggle('btn-light', !isActive);
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

function resolveSearchLots(developmentId = null) {
    const targetDevelopmentId = Number(developmentId || currentDevelopment?.id);

    if (!targetDevelopmentId) return searchableLotsCache;

    const ahawell = DEVELOPMENT_TREE.find(dev => Number(dev.id) === 3);
    if (targetDevelopmentId === 3 && ahawell?.children?.length) {
        const childIds = ahawell.children.map(child => Number(child.id));
        return searchableLotsCache.filter(lot => childIds.includes(Number(lot.development_id)));
    }

    return searchableLotsCache.filter(lot => Number(lot.development_id) === targetDevelopmentId);
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

    if (!mapBase || !svgLayer) return;

    mapBase.src = resolveMediaUrl(development.png_image);
    mapBase.alt = `Masterplan ${development.name}`;

    svgLayer.innerHTML = '';
}

function updateModalHeader(development) {
    const modalTitle = document.getElementById('developmentModalTitle');
    const modalSubtitle = document.getElementById('developmentModalSubtitle');
    if (!modalTitle || !modalSubtitle) return;

    const isAhawellRootView =
        Number(selectedModalRootDevelopmentId) === AHAWELL_ROOT_ID &&
        Number(development.id) === AHAWELL_ROOT_ID;

    if (isAhawellRootView) {
        modalTitle.textContent = 'Seleccione un desarrollo de Ahawell para continuar';
        modalSubtitle.textContent = 'Selecciona uno de los 5 desarrollos del cluster Ahawell.';
        return;
    }

    modalTitle.textContent = development.name;
    modalSubtitle.textContent = 'Selecciona un lote para agregar al proyecto de tu casa';
}

function updateSvgLayerVisibility(developmentId) {
    const svgLayer = document.getElementById('dynamicSvgLayer');
    if (!svgLayer) return;

    svgLayer.style.opacity = '1';
    svgLayer.style.pointerEvents = 'auto';
}

function getRedirectTargetDevelopmentId(item) {
    if (!item) return null;
    if (Number(item.redirect) !== 1) return null;

    const redirectTargetId = Number(item.redirect_url);
    if (Number.isNaN(redirectTargetId) || redirectTargetId <= 0) return null;

    return redirectTargetId;
}

function getDevelopmentNameById(developmentId) {
    const flatDevelopments = flattenDevelopments(DEVELOPMENT_TREE);
    const matched = flatDevelopments.find(dev => Number(dev.id) === Number(developmentId));
    return matched?.name || `desarrollo ${developmentId}`;
}

function normalizeHexColor(color) {
    if (!color) return '';
    const normalized = String(color).trim();

    if (!normalized) return '';
    if (normalized.startsWith('#')) return normalized;
    if (/^[0-9a-fA-F]{3,8}$/.test(normalized)) return `#${normalized}`;

    return normalized;
}

async function loadSvgLayer(development) {
    const svgLayer = document.getElementById('dynamicSvgLayer');
    const svgUrl = resolveMediaUrl(development.svg_image);

    if (!svgLayer) return;
    if (!svgUrl) {
        updateSvgLayerVisibility(development.id);
        return;
    }

    try {
        const proxyUrl = `/svg-proxy?url=${encodeURIComponent(svgUrl)}`;

        const response = await fetch(proxyUrl);

        if (!response.ok) {
            throw new Error('No se pudo cargar el SVG');
        }

        const svgText = await response.text();
        svgLayer.innerHTML = svgText;
        updateSvgLayerVisibility(development.id);

    } catch (error) {
        updateSvgLayerVisibility(development.id);
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

function bindSvgInteractions(svgLayer, lotsCache) {
    currentMap.forEach(item => {
        if (!item?.selectorSVG) return;

        const svgElement = svgLayer.querySelector(`#${item.selectorSVG}`);
        if (!svgElement) return;

        const redirectTargetId = getRedirectTargetDevelopmentId(item);
        if (redirectTargetId) {
            const baseColor = normalizeHexColor(item.color) || 'rgba(56, 110, 250, 0.25)';
            const activeColor = normalizeHexColor(item.color_active) || 'rgba(56, 110, 250, 0.55)';

            paintSvg(svgElement, baseColor);
            svgElement.style.cursor = 'pointer';

            new bootstrap.Tooltip(svgElement, {
                title: `Abrir ${getDevelopmentNameById(redirectTargetId)}`
            });

            svgElement.addEventListener('mouseenter', () => {
                paintSvg(svgElement, activeColor);
            });

            svgElement.addEventListener('mouseleave', () => {
                paintSvg(svgElement, baseColor);
            });

            svgElement.addEventListener('click', e => {
                e.preventDefault();
                e.stopPropagation();
                setActiveSearchDevelopment(redirectTargetId);
                loadDevelopment(redirectTargetId);
            });

            return;
        }

        if (!item.lote_id) return;

        const matchedLot = getMappedLot(item, lotsCache);
        if (!matchedLot) return;

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

            const { input, hiddenLotId } = getActiveInputElements();
            if (input) input.value = getSelectedLotLabel(matchedLot);
            if (hiddenLotId) hiddenLotId.value = matchedLot.id;

            renderSelectedLot(matchedLot);

            const modalEl = document.getElementById('modalPiaro');
            const modal = bootstrap.Modal.getInstance(modalEl);
            if (modal) modal.hide();
        });
    });
}

async function loadDevelopment(developmentId) {
    const svgLayer = document.getElementById('dynamicSvgLayer');

    try {
        const development = await fetchDevelopment(developmentId);
        currentDevelopment = development;
        currentMap = development.map || development.lotes || [];

        renderMapAssets(development);
        updateModalHeader(development);
        await loadSvgLayer(development);

        const isAhawellRootView = Number(development.id) === AHAWELL_ROOT_ID;
        if (isAhawellRootView) {
            window.lotsCache = [];
            highlightActiveDevelopment(0);
            if (svgLayer) {
                bindSvgInteractions(svgLayer, window.lotsCache);
            }
            return;
        }

        const lots = await fetchLotsForStage(development.stage_id);
        window.lotsCache = lots.map(lot => ({
            ...lot,
            development_id: development.id,
            development_name: development.name
        }));

        if (svgLayer) {
            bindSvgInteractions(svgLayer, window.lotsCache);
        }
        highlightActiveDevelopment(developmentId);
    } catch (error) {
        console.error(error);
    }
}

function setSelectedModalRootDevelopment(developmentId) {
    selectedModalRootDevelopmentId = Number(developmentId);
    setDevelopmentButtons(selectedModalRootDevelopmentId);
}
/*************************************************
 * DOM READY
 *************************************************/
document.addEventListener('DOMContentLoaded', function () {
    const changeLotBtn = document.getElementById('changeLotBtn');

    setDevelopmentButtons(33);
    setActiveSearchDevelopment(33);
    loadDevelopment(33);
    preloadSearchableLots().catch(error => console.error(error));

    document.querySelectorAll('.js-open-development-modal').forEach(button => {
        button.addEventListener('click', () => {
            const developmentId = Number(button.dataset.developmentId);
            setSelectedModalRootDevelopment(developmentId);
            setActiveSearchDevelopment(developmentId);
            loadDevelopment(developmentId);
        });
    });

    document.querySelectorAll('.development-lot-input').forEach(input => {
        const developmentId = Number(input.dataset.developmentId);
        const { dropdown, hiddenLotId } = getInputElementsForDevelopment(developmentId);

        if (!dropdown) return;

        input.addEventListener('focus', () => setActiveSearchDevelopment(developmentId));

        input.addEventListener('input', function () {
            const allowedStatuses = ['sold', 'reserved'];
            const value = this.value.toLowerCase().trim();
            dropdown.innerHTML = '';

            const scopedLots = resolveSearchLots(developmentId);

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
                    setActiveSearchDevelopment(developmentId);
                    input.value = lot.development_name ? `${lot.development_name} - Lote ${lot.name}` : lot.name;
                    if (hiddenLotId) hiddenLotId.value = lot.id;
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
    });

    document.addEventListener('click', e => {
        if (!e.target.closest('.position-relative')) {
            document.querySelectorAll('.development-lot-dropdown').forEach(dropdown => {
                dropdown.style.display = 'none';
            });
        }
    });

    if (changeLotBtn) {
        changeLotBtn.onclick = () => {
            clearSelectedLot();
            document.getElementById('selectedLotCard').classList.add('d-none');
            document.getElementById('piaroInitialContent').classList.remove('d-none');
            document.querySelectorAll('.development-lot-input').forEach(input => input.value = '');
            document.querySelectorAll('[id^="lotId-"]').forEach(hidden => hidden.value = '');
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
