document.addEventListener('DOMContentLoaded', () => {

    document.querySelectorAll('.capturar').forEach(btn => {
        btn.addEventListener('click', () => {

            if (!loteEsValido()) {
                mostrarErrorLote();
                return;
            }


            const wrappers = document.querySelectorAll('.thumb-wrapper');

            const miniaturasData = Array.from(wrappers).map(wrapper => ({
                base: wrapper.querySelector('img.tumb-original')?.src || '',
                overlays: Array.from(
                    wrapper.querySelectorAll('.overlay-container img')
                ).map(img => img.src)
            }));

            localStorage.setItem(
                'miniaturasData',
                JSON.stringify(miniaturasData)
            );

            window.location.href = '/resumen';
        });
    });

});


function mostrarErrorLote() {
    const card = document.getElementById('piaroCard');
    card.scrollIntoView({ behavior: 'smooth', block: 'center' });

    // Shake visual
    card.animate(
        [
            { transform: 'translateX(0)' },
            { transform: 'translateX(-6px)' },
            { transform: 'translateX(6px)' },
            { transform: 'translateX(0)' }
        ],
        { duration: 300 }
    );

    // Mensaje
    if (!document.getElementById('loteErrorMsg')) {
        const msg = document.createElement('div');
        msg.id = 'loteErrorMsg';
        msg.className = 'alert alert-danger mt-3';
        msg.innerText = 'Debes seleccionar un lote en Piaro para continuar.';
        card.querySelector('.accordion-body').prepend(msg);
    }
}

function loteEsValido() {
    return (
        selections.lote &&
        typeof selections.lote === 'object' &&
        selections.lote.id &&
        parseFloat(selections.lote.total) > 0
    );
}
