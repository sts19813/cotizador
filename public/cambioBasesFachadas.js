let slug = window.location.pathname.split("/").filter(Boolean).pop() || "home";
console.log(slug);

$(document).ready(function () {
    // Cuando eligen una habitación
    $("#opciones-habitaciones .option-card").on("click", function () {
        let habitacionId = $(this).data("id"); // ej. "1Recamara", "2Recamaras", etc.

        // Ocultamos todas las fachadas
        $("#opciones-fachada .option-card").parent().hide();

        // Definir los pre_code válidos por habitaciones
        let validPreCodes = [];
        if (habitacionId === "1Recamara") validPreCodes = ["FAC01"];
        if (habitacionId === "2Recamaras") validPreCodes = ["FAC02"];
        if (habitacionId === "3Recamaras") validPreCodes = ["FAC03"];
        if (habitacionId === "4Recamaras") validPreCodes = ["FAC04"];

        // Mostramos solo las fachadas permitidas
        validPreCodes.forEach(pre => {
            $(`#opciones-fachada .option-card[data-pre_code="${pre}"]`).parent().show();
        });

        // Revisar si la fachada seleccionada sigue siendo válida
        let currentFachada = $("#opciones-fachada .option-card.selected");
        let fachadaA = null;

        if (currentFachada.length && validPreCodes.includes(currentFachada.data("pre_code"))) {
            // ✅ Mantener la fachada seleccionada
            fachadaA = currentFachada;
        } else {
            // ❌ Si no es válida, seleccionamos la Fachada A del grupo
            fachadaA = $(`#opciones-fachada .option-card[data-pre_code="${validPreCodes[0]}"][data-valor*="A"]`);
        }

        // Seleccionar automáticamente la fachada
        if (fachadaA && fachadaA.length) {
            fachadaA.trigger("click");

            // Mantener coherencia de las demás opciones
            refreshSelectionsAndOverlays();
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
        'Fachada A': ['min01-01-A.webp', 'min01-02-A.webp', 'min01-03-A.webp', 'min01-04-A.webp'],
        'Fachada B': ['min01-01-B.webp', 'min01-02-B.webp', 'min01-03-B.webp', 'min01-04-B.webp'],
        'Fachada 2A': ['min02-01-A.webp', 'min02-02-A.webp', 'min02-03-A.webp', 'min02-04-A.webp'],
        'Fachada 2B': ['min02-01-B.webp', 'min02-02-B.webp', 'min02-03-B.webp', 'min02-04-B.webp'],
        'Fachada 3A': ['min03-01-A.webp', 'min03-02-A.webp', 'min03-03-A.webp', 'min03-04-A.webp'],
        'Fachada 3B': ['min03-01-B.webp', 'min03-02-B.webp', 'min03-03-B.webp', 'min03-04-B.webp'],
        'Fachada 4A': ['min04-01-A.webp', 'min04-02-A.webp', 'min04-03-A.webp', 'min04-04-A.webp']
    };

    const baseFolder = bases[slug] || 'minimalista';
    const files = fachadaFiles[valor];

    if (!files) return;

    files.forEach((file, i) => {
        if (items[i]) {
            items[i].src = `/bases/${baseFolder}/${file}`;
        }
    });
    cambiarImagen(0);
}