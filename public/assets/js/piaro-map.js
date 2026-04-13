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
let developmentLoadRequestId = 0;

const AHAWELL_ROOT_ID = 3;
const AHAWELL_CLUSTER_BASE_COLOR = 'rgba(52, 199, 89, 0.22)';
const AHAWELL_CLUSTER_ACTIVE_COLOR = 'rgba(52, 199, 89, 1)';
const DEVELOPMENT_LOGOS = {
    33: {
        src: '/img/logos/piaro.svg',
        alt: 'Piaro'
    },
    43: {
        src: '/img/logos/pase%20peninsula.svg',
        alt: 'Paseo Peninsula'
    },
    3: {
        src: '/img/logos/ahawell.svg',
        alt: 'Ahawell'
    }
};

function findParentDevelopmentByChildId(childId) {
    const numericChildId = Number(childId);
    if (!numericChildId) return null;

    return DEVELOPMENT_TREE.find(dev =>
        Array.isArray(dev.children) && dev.children.some(child => Number(child.id) === numericChildId)
    ) || null;
}

function getRootDevelopmentId(developmentId) {
    const numericId = Number(developmentId);
    if (!numericId) return null;

    const directDevelopment = DEVELOPMENT_TREE.find(dev => Number(dev.id) === numericId);
    if (directDevelopment) return Number(directDevelopment.id);

    const parent = findParentDevelopmentByChildId(numericId);
    return parent ? Number(parent.id) : null;
}

function isAhawellChildDevelopment(developmentId) {
    const parent = findParentDevelopmentByChildId(developmentId);
    return Number(parent?.id) === AHAWELL_ROOT_ID;
}

function getLogoConfigForDevelopment(developmentId) {
    const rootId = getRootDevelopmentId(developmentId) || Number(developmentId);
    return DEVELOPMENT_LOGOS[rootId] || null;
}

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

function setMapLoadingState(isLoading) {
    const mapContainer = document.getElementById('developmentMapContainer');
    if (!mapContainer) return;

    mapContainer.classList.toggle('is-loading', Boolean(isLoading));
}

function getDevelopmentDisplayNameById(developmentId, fallbackName = '') {
    const numericId = Number(developmentId);
    if (!numericId) return fallbackName;

    const directDevelopment = DEVELOPMENT_TREE.find(dev => Number(dev.id) === numericId);
    if (directDevelopment) {
        return directDevelopment.name || fallbackName;
    }

    const parentDevelopment = DEVELOPMENT_TREE.find(dev =>
        Array.isArray(dev.children) && dev.children.some(child => Number(child.id) === numericId)
    );
    if (!parentDevelopment) {
        return fallbackName || `desarrollo ${developmentId}`;
    }

    const childDevelopment = parentDevelopment.children.find(child => Number(child.id) === numericId);
    if (!childDevelopment) {
        return fallbackName || `desarrollo ${developmentId}`;
    }

    if (Number(parentDevelopment.id) === AHAWELL_ROOT_ID) {
        return `${parentDevelopment.name} - ${childDevelopment.name}`;
    }

    return childDevelopment.name || fallbackName || `desarrollo ${developmentId}`;
}

function getSelectedLotLabel(lot, developmentName = null) {
    const lotName = lot?.name ?? lot?.lote_id ?? '';
    const resolvedDevelopmentName =
        developmentName ||
        lot?.development_display_name ||
        lot?.development_name ||
        getDevelopmentDisplayNameById(lot?.development_id, currentDevelopment?.name) ||
        currentDevelopment?.name;

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

function setDevelopmentButtons(activeDevelopmentId) {
    const container = document.getElementById('developmentSelector');
    if (!container) return;

    container.innerHTML = '';
    container.classList.remove('d-none');

    const numericActiveId = Number(activeDevelopmentId);
    const activeRootId = getRootDevelopmentId(numericActiveId) || Number(selectedModalRootDevelopmentId) || 33;

    const rootButtons = document.createElement('div');
    rootButtons.className = 'development-selector-roots';

    DEVELOPMENT_TREE.forEach(development => {
        const rootBtn = document.createElement('button');
        rootBtn.type = 'button';
        rootBtn.className = 'btn btn-sm development-btn development-root-btn ' + development.name + '-btn';
        rootBtn.textContent = development.name;
        rootBtn.dataset.developmentId = development.id;
        rootBtn.dataset.developmentGroup = 'root';
        rootBtn.addEventListener('click', () => {
            setActiveSearchDevelopment(development.id);
            loadDevelopment(development.id);
        });
        rootButtons.appendChild(rootBtn);
    });

    container.appendChild(rootButtons);
    document.querySelector(".Ahawell-btn").disabled = true;

    if (activeRootId === AHAWELL_ROOT_ID) {
        const ahawell = DEVELOPMENT_TREE.find(dev => Number(dev.id) === AHAWELL_ROOT_ID);
        if (ahawell?.children?.length) {
            const childButtons = document.createElement('div');
            childButtons.className = 'development-selector-cluster mt-2';

            ahawell.children.forEach(child => {
                const childBtn = document.createElement('button');
                childBtn.type = 'button';
                childBtn.className = 'btn btn-sm development-btn development-child-btn';
                childBtn.textContent = child.name;
                childBtn.dataset.developmentId = child.id;
                childBtn.dataset.developmentGroup = 'child';
                childBtn.addEventListener('click', () => {
                    setActiveSearchDevelopment(child.id);
                    loadDevelopment(child.id);
                });
                childButtons.appendChild(childBtn);
            });

            container.appendChild(childButtons);
        }
    }
}

function toggleDevelopmentButtonState(button, isActive) {
    button.classList.toggle('active', isActive);
    button.classList.toggle('btn-primary', isActive);
    button.classList.toggle('text-white', isActive);
    button.classList.toggle('btn-light', !isActive);
}

function highlightActiveDevelopment(id) {
    const numericId = Number(id);
    const activeRootId = getRootDevelopmentId(numericId) || Number(selectedModalRootDevelopmentId);
    const isChildView = isAhawellChildDevelopment(numericId);

    document.querySelectorAll('.development-root-btn').forEach(btn => {
        const isActive = Number(btn.dataset.developmentId) === activeRootId;
        toggleDevelopmentButtonState(btn, isActive);
    });

    document.querySelectorAll('.development-child-btn').forEach(btn => {
        const isActive = isChildView && Number(btn.dataset.developmentId) === numericId;
        toggleDevelopmentButtonState(btn, isActive);
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
        const developmentDisplayName = getDevelopmentDisplayNameById(development.id, development.name);

        return lots.map(lot => ({
            ...lot,
            development_id: development.id,
            development_name: development.name,
            development_display_name: developmentDisplayName,
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

    if (!mapBase || !svgLayer) return Promise.resolve();

    const mapUrl = resolveMediaUrl(development.png_image);
    mapBase.alt = `Masterplan ${development.name}`;
    svgLayer.innerHTML = '';

    if (!mapUrl) {
        mapBase.removeAttribute('src');
        return Promise.resolve();
    }

    return new Promise(resolve => {
        const onReady = () => {
            mapBase.removeEventListener('load', onReady);
            mapBase.removeEventListener('error', onReady);
            resolve();
        };

        const isSameSource = mapBase.getAttribute('src') === mapUrl || mapBase.src === mapUrl;
        if (isSameSource && mapBase.complete) {
            resolve();
            return;
        }

        mapBase.addEventListener('load', onReady, { once: true });
        mapBase.addEventListener('error', onReady, { once: true });

        mapBase.src = mapUrl;
    });
}

function updateModalHeader(development) {
    const modalTitle = document.getElementById('developmentModalTitle');
    const modalLogo = document.getElementById('developmentModalLogo');
    const modalSubtitle = document.getElementById('developmentModalSubtitle');
    if (!modalTitle || !modalSubtitle) return;

    const logoConfig = getLogoConfigForDevelopment(development.id);
    if (modalLogo && logoConfig) {
        modalLogo.src = logoConfig.src;
        modalLogo.alt = logoConfig.alt;
        modalTitle.setAttribute('aria-label', logoConfig.alt);
    }

    const isAhawellRootView = Number(development.id) === AHAWELL_ROOT_ID;
    const isAhawellChildView = isAhawellChildDevelopment(development.id);

    if (isAhawellRootView) {
        modalSubtitle.textContent = 'Selecciona uno de los 5 desarrollos del cluster Ahawell.';
        return;
    }

    if (isAhawellChildView) {
        modalSubtitle.textContent = `Ahawell - ${development.name}: selecciona un lote para agregar al proyecto de tu casa`;
        return;
    }

    modalSubtitle.textContent = 'Selecciona un lote para agregar al proyecto de tu casa';
}

function updateSvgLayerVisibility() {
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
    return getDevelopmentDisplayNameById(developmentId);
}

function normalizeHexColor(color) {
    if (!color) return '';
    const normalized = String(color).trim();

    if (!normalized) return '';
    if (normalized.startsWith('#')) return normalized;
    if (/^[0-9a-fA-F]{3,8}$/.test(normalized)) return `#${normalized}`;

    return normalized;
}

async function loadSvgLayer(development, requestId) {
    const svgLayer = document.getElementById('dynamicSvgLayer');
    const svgUrl = resolveMediaUrl(development.svg_image);

    if (!svgLayer) return;
    if (!svgUrl) {
        updateSvgLayerVisibility();
        return;
    }

    try {
        const proxyUrl = `/svg-proxy?url=${encodeURIComponent(svgUrl)}`;

        const response = await fetch(proxyUrl);
        if (requestId !== developmentLoadRequestId) return;

        if (!response.ok) {
            throw new Error('No se pudo cargar el SVG');
        }

        const svgText = await response.text();
        if (requestId !== developmentLoadRequestId) return;

        svgLayer.innerHTML = svgText;
        updateSvgLayerVisibility();

    } catch (error) {
        if (requestId === developmentLoadRequestId) {
            updateSvgLayerVisibility();
        }
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

function escapeCssSelectorValue(selectorValue) {
    if (window.CSS && typeof window.CSS.escape === 'function') {
        return window.CSS.escape(selectorValue);
    }

    return String(selectorValue).replace(/([ #;?%&,.+*~':"!^$[\]()=>|/@])/g, '\\$1');
}

function resolveSvgElement(svgLayer, rawSelector) {
    if (!svgLayer || !rawSelector) return null;

    const selectorValue = String(rawSelector).trim();
    if (!selectorValue) return null;

    const plainId = selectorValue.replace(/^#/, '');
    const attempts = [
        `#${escapeCssSelectorValue(plainId)}`,
        `[id="${plainId.replace(/"/g, '\\"')}"]`
    ];

    if (selectorValue.startsWith('#')) {
        attempts.push(selectorValue);
    }

    for (const selector of attempts) {
        try {
            const element = svgLayer.querySelector(selector);
            if (element) return element;
        } catch (_error) {
            continue;
        }
    }

    return null;
}

function bindSvgInteractions(svgLayer, lotsCache) {
    currentMap.forEach(item => {
        if (!item?.selectorSVG) return;

        const svgElement = resolveSvgElement(svgLayer, item.selectorSVG);
        if (!svgElement) return;

        const redirectTargetId = getRedirectTargetDevelopmentId(item);
        if (redirectTargetId) {
            const isAhawellRootView = Number(currentDevelopment?.id) === AHAWELL_ROOT_ID;
            const baseColor = isAhawellRootView
                ? AHAWELL_CLUSTER_BASE_COLOR
                : (normalizeHexColor(item.color) || 'rgba(56, 110, 250, 0.25)');
            const activeColor = isAhawellRootView
                ? AHAWELL_CLUSTER_ACTIVE_COLOR
                : (normalizeHexColor(item.color_active) || 'rgba(56, 110, 250, 0.55)');

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
                paintSvg(svgElement, activeColor);
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
            const lotDevelopmentId = matchedLot.development_id || currentDevelopment.id;
            const lotDevelopmentName = matchedLot.development_name || currentDevelopment.name;
            const lotDevelopmentDisplayName =
                matchedLot.development_display_name ||
                getDevelopmentDisplayNameById(lotDevelopmentId, lotDevelopmentName);

            selections.lote = {
                id: matchedLot.id,
                name: getSelectedLotLabel(matchedLot, lotDevelopmentDisplayName),
                lot_name: matchedLot.name,
                development_id: lotDevelopmentId,
                development_name: lotDevelopmentName,
                development_display_name: lotDevelopmentDisplayName,
                area: matchedLot.area,
                price_square_meter: matchedLot.price_square_meter,
                total: loteTotal,
                origen: 'svg',
                suma: true
            };

            localStorage.setItem('selections', JSON.stringify(selections));
            recalcularPrecioTotal();

            const { input, hiddenLotId } = getActiveInputElements();
            if (input) input.value = getSelectedLotLabel(matchedLot, lotDevelopmentDisplayName);
            if (hiddenLotId) hiddenLotId.value = matchedLot.id;

            renderSelectedLot(matchedLot, lotDevelopmentDisplayName);

            const modalEl = document.getElementById('modalPiaro');
            const modal = bootstrap.Modal.getInstance(modalEl);
            if (modal) modal.hide();
        });
    });
}

async function loadDevelopment(developmentId) {
    const svgLayer = document.getElementById('dynamicSvgLayer');
    const requestId = ++developmentLoadRequestId;

    setMapLoadingState(true);

    try {
        const resolvedRootId = getRootDevelopmentId(developmentId);
        if (resolvedRootId) {
            selectedModalRootDevelopmentId = resolvedRootId;
        }
        setDevelopmentButtons(developmentId);

        const development = await fetchDevelopment(developmentId);
        if (requestId !== developmentLoadRequestId) return;

        currentDevelopment = development;
        currentMap = development.map || development.lotes || [];

        updateModalHeader(development);
        await Promise.all([
            renderMapAssets(development),
            loadSvgLayer(development, requestId)
        ]);
        if (requestId !== developmentLoadRequestId) return;

        highlightActiveDevelopment(development.id);

        const isAhawellRootView = Number(development.id) === AHAWELL_ROOT_ID;
        if (isAhawellRootView) {
            window.lotsCache = [];
            if (svgLayer) {
                bindSvgInteractions(svgLayer, window.lotsCache);
            }
            return;
        }

        const lots = await fetchLotsForStage(development.stage_id);
        if (requestId !== developmentLoadRequestId) return;

        const developmentDisplayName = getDevelopmentDisplayNameById(development.id, development.name);
        window.lotsCache = lots.map(lot => ({
            ...lot,
            development_id: development.id,
            development_name: development.name,
            development_display_name: developmentDisplayName
        }));

        if (svgLayer) {
            bindSvgInteractions(svgLayer, window.lotsCache);
        }
    } catch (error) {
        console.error(error);
    } finally {
        if (requestId === developmentLoadRequestId) {
            setMapLoadingState(false);
        }
    }
}

function setSelectedModalRootDevelopment(developmentId) {
    const rootId = getRootDevelopmentId(developmentId) || Number(developmentId) || 33;
    selectedModalRootDevelopmentId = rootId;
    setDevelopmentButtons(developmentId);
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
                const lotDevelopmentName =
                    lot.development_display_name ||
                    getDevelopmentDisplayNameById(lot.development_id, lot.development_name || currentDevelopment?.name);
                const developmentLabel = lotDevelopmentName ? `<small class="text-muted d-block">${lotDevelopmentName}</small>` : '';
                item.innerHTML = `${developmentLabel}<strong>Lote ${lot.name}</strong>`;
                isSelectingLot = false;

                item.onclick = () => {
                    isSelectingLot = true;
                    setActiveSearchDevelopment(developmentId);
                    input.value = lotDevelopmentName ? `${lotDevelopmentName} - Lote ${lot.name}` : lot.name;
                    if (hiddenLotId) hiddenLotId.value = lot.id;
                    dropdown.style.display = 'none';

                    window.selectedLote = lot;
                    clearSelectedLot();

                    selections.lote = {
                        id: lot.id,
                        name: getSelectedLotLabel(lot, lotDevelopmentName),
                        lot_name: lot.name,
                        development_id: lot.development_id || currentDevelopment?.id,
                        development_name: lot.development_name || currentDevelopment?.name,
                        development_display_name: lotDevelopmentName,
                        area: lot.area,
                        price_square_meter: lot.price_square_meter,
                        total: lot.area * lot.price_square_meter,
                        origen: 'input',
                        suma: false
                    };
                    localStorage.setItem('selections', JSON.stringify(selections));

                    renderSelectedLot(lot, lotDevelopmentName);
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
