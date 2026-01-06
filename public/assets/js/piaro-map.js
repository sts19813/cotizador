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

/*************************************************
 * ESPERAR LOTES
 *************************************************/
function waitForLots(callback) {
    const interval = setInterval(() => {
        if (Array.isArray(window.lotsCache) && window.lotsCache.length > 0) {
            clearInterval(interval);
            callback();
        }
    }, 100);
}


/*************************************************
 * RENDER CARD LOTE SELECCIONADO
 *************************************************/
function renderSelectedLot(lot) {

    debugger

    document.getElementById('lotTitle').textContent =
        'Lote Piaro Tropical Living';

    document.getElementById('lotName').textContent = lot.name;
    document.getElementById('lotArea').textContent = `${lot.area} m²`;
    document.getElementById('lotPriceM2').textContent =
        `$${Number(lot.price_square_meter).toLocaleString()}`;
    document.getElementById('lotTotal').textContent =
        `$${Number(lot.area * lot.price_square_meter).toLocaleString()}`;

    document.getElementById('piaroInitialContent')
        .classList.add('d-none');

    document.getElementById('selectedLotCard')
        .classList.remove('d-none');
}


/*************************************************
 * DOM READY
 *************************************************/
document.addEventListener('DOMContentLoaded', function () {

    const input = document.getElementById('lotInput');
    const dropdown = document.getElementById('lotDropdown');
    const hiddenLotId = document.getElementById('lotId');
    const svgLayer = document.querySelector('.svg-layer');
    const changeLotBtn = document.getElementById('changeLotBtn');

    const STAGE_ID = 19;
    const API_URL = window.API_URL;

    /*************************************************
     * CARGAR LOTES
     *************************************************/
    fetch(`${API_URL}?stage_id=${STAGE_ID}`)
        .then(res => res.json())
        .then(data => {
            window.lotsCache = data;
        })
        .catch(console.error);


    /*************************************************
     * AUTOCOMPLETE INPUT
     *************************************************/
    input.addEventListener('input', function () {

        const value = this.value.toLowerCase().trim();
        dropdown.innerHTML = '';

        if (!value) {
            dropdown.style.display = 'none';
            return;
        }

        const matches = window.lotsCache.filter(l =>
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

            item.innerHTML = `
                <strong>Lote ${lot.name}</strong>
                <small class="d-block">
                    ${lot.area} m² · $${Number(lot.total_price).toLocaleString()}
                </small>
            `;

            item.onclick = () => {

                input.value = lot.name;
                hiddenLotId.value = lot.id;
                dropdown.style.display = 'none';

                window.selectedLote = lot;
                localStorage.setItem('selected_lot', JSON.stringify(lot));

                renderSelectedLot(lot);

                const modal = bootstrap.Modal.getInstance(
                    document.getElementById('modalPiaro')
                );
                if (modal) modal.hide();
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

    document.getElementById('saveLotBtn').onclick = () => {

        if (!window.selectedLote) return;

        renderSelectedLot(window.selectedLote);
    };


    /*************************************************
     * SVG INTERACTIVO
     *************************************************/
    if (!svgLayer || !window.masterplanMap) return;

    waitForLots(() => {

        window.masterplanMap.forEach(item => {

            if (!item.selectorSVG || !item.lote_id) return;

            const matchedLot = window.lotsCache.find(l =>
                String(l.id) === String(item.lote_id) ||
                String(l.id_lote) === String(item.lote_id)
            );

            if (!matchedLot) return;

            const svgElement = svgLayer.querySelector(`#${item.selectorSVG}`);
            if (!svgElement) return;

            const status = matchedLot.status;
            const fillColor = statusColors[status] ?? 'rgba(100,100,100,.8)';
            const isSelectable = status === 'for_sale';

            svgElement.querySelectorAll('*').forEach(el =>
                el.style.setProperty('fill', fillColor, 'important')
            );

            svgElement.dataset.loteInfo = JSON.stringify(matchedLot);
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
                svgElement.querySelectorAll('*').forEach(el =>
                    el.style.setProperty('fill', 'rgba(0,120,255,.8)', 'important')
                );
            });

            svgElement.addEventListener('mouseleave', () => {
                svgElement.querySelectorAll('*').forEach(el =>
                    el.style.setProperty('fill', fillColor, 'important')
                );
            });

            svgElement.addEventListener('click', e => {
                e.preventDefault();

                window.selectedLote = matchedLot;

                input.value = matchedLot.name;
                hiddenLotId.value = matchedLot.id;

                renderSelectedLot(matchedLot);
            });
        });
    });


    /*************************************************
     * CAMBIAR LOTE
     *************************************************/
    if (changeLotBtn) {
        changeLotBtn.onclick = () => {

            document.getElementById('selectedLotCard')
                .classList.add('d-none');

            document.getElementById('piaroInitialContent')
                .classList.remove('d-none');

            input.value = '';
            hiddenLotId.value = '';
            window.selectedLote = null;
        };

    }
});
