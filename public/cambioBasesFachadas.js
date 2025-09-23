let slug = window.location.pathname.split("/").filter(Boolean).pop() || "home";
console.log(slug);

$(document).ready(function () {
    // Cuando eligen una habitación
    $("#opciones-habitaciones .option-card").on("click", function () {
        let habitacionId = $(this).data("id"); // ej. "1Recamara", "2Recamaras", etc.

        // Ocultamos todas las fachadas
        $("#opciones-fachada .option-card").parent().hide();

        let fachadaA = null;

        // Mostramos solo las que corresponden
        if (habitacionId === "1Recamara") {
            $('#opciones-fachada .option-card[data-pre_code="FAC01"]').parent().show();
            fachadaA = $('#opciones-fachada .option-card[data-pre_code="FAC01"][data-valor="Fachada A"]');
        }
        if (habitacionId === "2Recamaras") {
            $('#opciones-fachada .option-card[data-pre_code="FAC02"]').parent().show();
            fachadaA = $('#opciones-fachada .option-card[data-pre_code="FAC02"][data-valor="Fachada 2A"]');
        }
        if (habitacionId === "3Recamaras") {
            $('#opciones-fachada .option-card[data-pre_code="FAC03"]').parent().show();
            fachadaA = $('#opciones-fachada .option-card[data-pre_code="FAC03"][data-valor="Fachada 3A"]');
        }
        if (habitacionId === "4Recamaras") {
            $('#opciones-fachada .option-card[data-pre_code="FAC04"]').parent().show();
            fachadaA = $('#opciones-fachada .option-card[data-pre_code="FAC04"][data-valor="Fachada 4A"]');
        }

        // Seleccionar automáticamente la fachada A
        if (fachadaA && fachadaA.length) {
            fachadaA.trigger("click");
        }
    });

    // Opcional: al inicio ocultamos todas y mostramos solo las de 1 recámara
    $("#opciones-fachada .option-card").parent().hide();
    $('#opciones-fachada .option-card[data-pre_code="FAC01"]').parent().show();
});
function CambioBases(items, valor) {
    const bases = {
        home: 'minimalista',
        tulum: 'tulum',
        mexicano: 'mexicano'
    };

    const fachadaFiles = {
        'Fachada A': ['min01-01-A.webp','min01-02-A.webp','min01-03-A.webp','min01-04-A.webp'],
        'Fachada B': ['min01-01-B.webp','min01-02-B.webp','min01-03-B.webp','min01-04-B.webp'],
        'Fachada 2A': ['min02-01-A.webp','min02-02-A.webp','min02-03-A.webp','min02-04-A.webp'],
        'Fachada 2B': ['min02-01-B.webp','min02-02-B.webp','min02-03-B.webp','min02-04-B.webp'],
        'Fachada 3A': ['min03-01-A.webp','min03-02-A.webp','min03-03-A.webp','min03-04-A.webp'],
        'Fachada 3B': ['min03-01-B.webp','min03-02-B.webp','min03-03-B.webp','min03-04-B.webp'],
        'Fachada 4A': ['min04-01-A.webp','min04-02-A.webp','min04-03-A.webp','min04-04-A.webp']
    };

    const baseFolder = bases[slug] || 'minimalista';
    const files = fachadaFiles[valor];

    if (!files) return;

    files.forEach((file, i) => {
        if (items[i]) {
            items[i].src = `/bases/${baseFolder}/${file}`;
        }
    });

    // Actualiza la imagen principal
    cambiarImagen(0);
}