document.addEventListener('DOMContentLoaded', () => {
    if (window.SHARED_CONFIG) {
        setTimeout(() => {
            aplicarConfiguracion(window.SHARED_CONFIG);
        }, 800);
    }
});


// Función para compartir configuración guarda en la base de datos todo el json de la configuracion
async function compartirConfiguracion() {

    const previewBase64 = await generarPreviewBase64();

    const data = {
        selections,
        fachada: selectedFachada,
        financiamiento: FINANCIAMIENTO,
        lote: selections.lote || null,
        style: window.currentStyle,
        preview: previewBase64 
    };

    const res = await fetch('/config/save', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
        },
        body: JSON.stringify({ data })
    });

    const result = await res.json();
    const url = result.url;

    const copied = await copyToClipboard(url);

    if (copied) {
        Swal.fire({
            icon: 'success',
            title: '¡Enlace copiado!',
            text: 'La configuración ha sido copiada al portapapeles.',
        });
    }
}


// Función para copiar texto al portapapeles con soporte para navegadores modernos y fallbacks
async function copyToClipboard(text) {
    try {
        // Método moderno (HTTPS requerido)
        if (navigator.clipboard && window.isSecureContext) {
            await navigator.clipboard.writeText(text);
            return true;
        }

        // Fallback (Safari viejo / HTTP)
        const textarea = document.createElement("textarea");
        textarea.value = text;
        textarea.style.position = "fixed";
        textarea.style.left = "-9999px";
        document.body.appendChild(textarea);

        textarea.focus();
        textarea.select();

        const success = document.execCommand("copy");
        textarea.remove();

        return success;
    } catch (err) {
        return false;
    }
}

/**
 * Aplica la configuración compartida al configurador. Esto se llama al cargar la página si detectamos que venimos de un enlace compartido.
 * @param {*} data contiene todo el json con las selecciones, fachada, financiamiento, lote, etc. que se guardó previamente en la base de datos. Es la misma estructura que se envía al compartir configuración.
 * @returns 
 */
function aplicarConfiguracion(data) {
    debugger
    if (!data) return;

    console.log('Aplicando configuración compartida...', data);

    // 1. Restaurar estado global
    selections = data.selections || {};
    selectedFachada = data.fachada || null;

    if (data.financiamiento) {
        Object.assign(FINANCIAMIENTO, data.financiamiento);
    }

    // Guardar en localStorage para integrarse con tu sistema actual
    localStorage.setItem('selections', JSON.stringify(selections));

    // ============================
    // 2. APLICAR FACHADA PRIMERO
    // ============================
    if (selectedFachada) {
        const fachadaEl = document.querySelector(
            `.option-card[data-categoria="Fachada"][data-valor="${selectedFachada}"]`
        );

        if (fachadaEl) {
            fachadaEl.click(); // esto dispara TODA tu lógica pesada
        }
    }

    // ============================
    // 3. APLICAR TODAS LAS OPCIONES
    // ============================
    Object.keys(selections).forEach(groupId => {
        const item = selections[groupId];

        if (!item || typeof item !== 'object') return;

        // ignorar fachada (ya aplicada)
        if (item.categoria === 'Fachada') return;

        if (item.categoria === 'Estilo') {
            return;
        }

        const selector = `.option-card[data-id="${item.id}"]`;
        const el = document.querySelector(selector);

        if (el) {
            el.click();
        } else {
            console.warn('No se encontró opción:', item);
        }
    }); 

    // ============================
    // 4. REAPLICAR OVERLAYS (IMPORTANTE)
    // ============================
    if (typeof refreshSelectionsAndOverlays === 'function') {
        refreshSelectionsAndOverlays();
    }

    // ============================
    // 5. RECALCULAR TODO
    // ============================
    if (typeof recalcularPrecioTotal === 'function') {
        recalcularPrecioTotal();
    }

    // ============================
    // 6. LOTE (si existe)
    // ============================
    if (data.lote) {
        selections.lote = data.lote;
    }

    console.log('Configuración aplicada correctamente');
}


async function generarPreviewBase64() {

    const originals = document.querySelectorAll('#owl-demo .item');
    if (originals.length < 2) return null;

    const imgBase = originals[1].querySelector('img');
    if (!imgBase) return null;

    //CONTENEDOR LIMPIO
    const container = document.createElement('div');
    container.style.position = 'fixed';
    container.style.top = '-9999px';
    container.style.left = '-9999px';
    container.style.width = '1200px';
    container.style.height = '630px';
    container.style.background = '#fff';
    container.style.overflow = 'hidden';

    //IMAGEN BASE
    const base = document.createElement('img');
    base.src = imgBase.src;
    base.style.width = '100%';
    base.style.height = '100%';
    base.style.objectFit = 'cover';
    base.style.position = 'absolute';

    container.appendChild(base);

    //OVERLAYS REALES
    const overlays = activeOverlays[1] || [];

    overlays.forEach((ov, i) => {
        if (!ov.url) return;

        const img = document.createElement('img');
        img.src = ov.url;

        img.style.position = 'absolute';
        img.style.top = '0';
        img.style.left = '0';
        img.style.width = '100%';
        img.style.height = '100%';
        img.style.objectFit = 'cover';
        img.style.zIndex = 10 + i;

        container.appendChild(img);
    });

    document.body.appendChild(container);

    //esperar carga real
    await Promise.all(
        Array.from(container.querySelectorAll('img')).map(img => {
            if (img.complete) return Promise.resolve();
            return new Promise(res => {
                img.onload = img.onerror = res;
            });
        })
    );

    const canvas = await html2canvas(container, {
        scale: 1,
        useCORS: true,
        backgroundColor: '#ffffff'
    });

    container.remove();

    return canvas.toDataURL('image/jpeg', 0.8);
}