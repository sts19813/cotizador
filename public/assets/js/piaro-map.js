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

let isSelectingLot = false;
window.currentLotsByDevelopment = {};

function getDevelopmentById(id) {
    return window.developmentsData?.[id] || null;
}

function loadLotsForDevelopment(development) {
    if (!development?.stage_id) return Promise.resolve([]);

    if (window.currentLotsByDevelopment[development.id]) {
        window.lotsCache = window.currentLotsByDevelopment[development.id];
        return Promise.resolve(window.lotsCache);
    }

    return fetch(`${window.API_URL}?stage_id=${development.stage_id}`)
        .then(res => res.json())
        .then(data => {
            window.currentLotsByDevelopment[development.id] = data;
            window.lotsCache = data;
            return data;
        })
        .catch(() => {
            window.lotsCache = [];
            return [];
        });
}

function renderSelectedLot(lot) {
    const development = getDevelopmentById(window.currentDevelopmentId);
    const developmentName = development?.name || 'Desarrollo';

    document.getElementById('lotTitle').textContent = `Lote ${developmentName}`;
    document.getElementById('lotName').textContent = lot.name;
    document.getElementById('lotArea').textContent = `${lot.area} m²`;
    document.getElementById('lotPriceM2').textContent = `$${Number(lot.price_square_meter).toLocaleString()}`;
    document.getElementById('lotTotal').textContent = `$${Number(lot.area * lot.price_square_meter).toLocaleString()}`;

    document.getElementById('piaroInitialContent').classList.add('d-none');

    if (!isSelectingLot) {
        document.getElementById('info-lote').classList.remove('d-none');
    } else {
        document.getElementById('info-lote').classList.add('d-none');
    }

    document.getElementById('selectedLotCard').classList.remove('d-none');
}

function clearSelectedLot() {
    if (selections["lote"]) {
        delete selections["lote"];
        localStorage.setItem('selections', JSON.stringify(selections));
        recalcularPrecioTotal();
    }
}

function paintSvg(el, color) {
    if (!el) return;
    el.style.setProperty('fill', color, 'important');
    el.querySelectorAll('*').forEach(child => child.style.setProperty('fill', color, 'important'));
}

function bindMapInteractions() {
    const svgLayer = document.querySelector('.svg-layer');
    const currentDevelopment = getDevelopmentById(window.currentDevelopmentId);
    const mapEntries = currentDevelopment?.map?.length ? currentDevelopment.map : (currentDevelopment?.lotes || []);

    if (!svgLayer || !Array.isArray(mapEntries)) return;

    mapEntries.forEach(item => {
        const selector = item.selectorSVG || item.selector_svg || item.selector;
        if (!selector) return;

        const svgElement = svgLayer.querySelector(`#${selector}`);
        if (!svgElement) return;

        const redirectDevelopmentId = item.redirect === 1 ? Number(item.redirect_url) : null;

        if (redirectDevelopmentId) {
            const baseColor = (item.color || '#9aa0a6').trim();
            const hoverColor = (item.color_active || '#4b5563').trim();

            paintSvg(svgElement, baseColor);
            svgElement.style.cursor = 'pointer';

            new bootstrap.Tooltip(svgElement, {
                html: true,
                title: `Ir a ${getDevelopmentById(redirectDevelopmentId)?.name || 'desarrollo'}`
            });

            svgElement.addEventListener('mouseenter', () => paintSvg(svgElement, hoverColor));
            svgElement.addEventListener('mouseleave', () => paintSvg(svgElement, baseColor));
            svgElement.addEventListener('click', e => {
                e.preventDefault();
                applyDevelopmentContext(redirectDevelopmentId);
            });
            return;
        }

        if (!item.lote_id) return;

        const matchedLot = window.lotsCache.find(l =>
            String(l.id) === String(item.lote_id) ||
            String(l.id_lote) === String(item.lote_id)
        );

        if (!matchedLot) return;

        const status = matchedLot.status;
        const fillColor = statusColors[status] ?? 'rgba(100,100,100,.8)';
        const isSelectable = status === 'for_sale';

        paintSvg(svgElement, fillColor);
        svgElement.style.cursor = isSelectable ? 'pointer' : 'not-allowed';

        new bootstrap.Tooltip(svgElement, {
            html: true,
            title: `Lote ${matchedLot.name}<br>${statusMap[status]}<br>Área: ${matchedLot.area} m²`
        });

        if (!isSelectable) return;

        svgElement.addEventListener('mouseenter', () => paintSvg(svgElement, 'rgba(0,120,255,.8)'));
        svgElement.addEventListener('mouseleave', () => paintSvg(svgElement, fillColor));

        svgElement.addEventListener('click', e => {
            e.preventDefault();
            isSelectingLot = false;
            window.selectedLote = matchedLot;

            clearSelectedLot();

            const development = getDevelopmentById(window.currentDevelopmentId);
            const loteTotal = matchedLot.area * matchedLot.price_square_meter;

            selections.lote = {
                id: matchedLot.id,
                name: `${development?.name || 'Desarrollo'} - Lote ${matchedLot.name}`,
                area: matchedLot.area,
                price_square_meter: matchedLot.price_square_meter,
                total: loteTotal,
                origen: 'svg',
                suma: true,
                development_id: development?.id
            };

            localStorage.setItem('selections', JSON.stringify(selections));
            recalcularPrecioTotal();

            document.getElementById('lotInput').value = matchedLot.name;
            document.getElementById('lotId').value = matchedLot.id;

            renderSelectedLot(matchedLot);

            const modal = bootstrap.Modal.getInstance(document.getElementById('modalPiaro'));
            if (modal) modal.hide();
        });
    });
}

function applyDevelopmentContext(developmentId) {
    const development = getDevelopmentById(developmentId);
    if (!development) return;

    window.currentDevelopmentId = development.id;
    window.masterplanMap = development.map || development.lotes || [];

    document.getElementById('selectedDevelopmentName').textContent = development.name;
    document.getElementById('selectedDevelopmentNameSecondary').textContent = development.name;
    document.getElementById('modalDevelopmentName').textContent = development.name;
    document.getElementById('modalFooterText').textContent = `¿Quieres conocer más acerca de ${development.name}?`;

    const bg = document.getElementById('masterplanBackground');
    const svgLayer = document.getElementById('piaroLotsLayer');

    const baseUrl = (window.API_URL || '').replace('api/lots', 'storage/');
    bg.src = development.png_image ? `${baseUrl}${development.png_image}` : '';
    svgLayer.innerHTML = development.svg_inline || '';

    loadLotsForDevelopment(development).then(() => bindMapInteractions());
}

document.addEventListener('DOMContentLoaded', function () {
    const input = document.getElementById('lotInput');
    const dropdown = document.getElementById('lotDropdown');
    const hiddenLotId = document.getElementById('lotId');
    const changeLotBtn = document.getElementById('changeLotBtn');
    const openDevelopmentModalBtn = document.getElementById('openDevelopmentModalBtn');
    const subDevelopmentsModalEl = document.getElementById('modalSubDevelopments');
    const subDevelopmentsList = document.getElementById('subDevelopmentsList');
    const subDevelopmentsModal = subDevelopmentsModalEl ? new bootstrap.Modal(subDevelopmentsModalEl) : null;

    applyDevelopmentContext(window.currentDevelopmentId || 33);

    document.querySelectorAll('.development-trigger').forEach(btn => {
        btn.addEventListener('click', () => {
            applyDevelopmentContext(Number(btn.dataset.developmentId));
        });
    });

    if (openDevelopmentModalBtn) {
        openDevelopmentModalBtn.addEventListener('click', e => {
            const currentBtn = document.querySelector(`.development-trigger[data-development-id="${window.currentDevelopmentId}"]`);
            const childIds = currentBtn ? JSON.parse(currentBtn.dataset.childIds || '[]') : [];

            if (!childIds.length) return;

            e.preventDefault();
            subDevelopmentsList.innerHTML = '';

            childIds.forEach(id => {
                const dev = getDevelopmentById(id);
                if (!dev) return;

                const button = document.createElement('button');
                button.type = 'button';
                button.className = 'btn btn-outline-primary w-100 mb-2';
                button.textContent = dev.name;
                button.addEventListener('click', () => {
                    applyDevelopmentContext(dev.id);
                    subDevelopmentsModal.hide();
                    const mapModal = new bootstrap.Modal(document.getElementById('modalPiaro'));
                    mapModal.show();
                });
                subDevelopmentsList.appendChild(button);
            });

            subDevelopmentsModal.show();
        });
    }

    input.addEventListener('input', function () {
        const allowedStatuses = ['sold', 'reserved'];
        const value = this.value.toLowerCase().trim();
        dropdown.innerHTML = '';

        if (!value) {
            dropdown.style.display = 'none';
            return;
        }

        const matches = window.lotsCache.filter(l =>
            allowedStatuses.includes(l.status) &&
            l.name.toLowerCase().includes(value)
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

            item.onclick = () => {
                isSelectingLot = true;
                input.value = lot.name;
                hiddenLotId.value = lot.id;
                dropdown.style.display = 'none';

                clearSelectedLot();

                const development = getDevelopmentById(window.currentDevelopmentId);
                selections.lote = {
                    id: lot.id,
                    name: `${development?.name || 'Desarrollo'} - Lote ${lot.name}`,
                    area: lot.area,
                    price_square_meter: lot.price_square_meter,
                    total: lot.area * lot.price_square_meter,
                    origen: 'input',
                    suma: false,
                    development_id: development?.id
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
