let slug = window.location.pathname.split("/").filter(Boolean).pop() || "home";

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
            // ❌ Si no es válida, seleccionamos la Fachada A del grupo correspondiente
            fachadaA = $(`#opciones-fachada .option-card[data-pre_code="${validPreCodes[0]}"][data-valor*="A"]`);
        }

        // Seleccionar automáticamente la fachada
        if (fachadaA && fachadaA.length) {
            fachadaA.trigger("click");
            refreshSelectionsAndOverlays();
        }
    });

    // ✅ Al inicio: mostrar solo fachadas de 4 recámaras y seleccionar la A
    $("#opciones-fachada .option-card").parent().hide();
    $('#opciones-fachada .option-card[data-pre_code="FAC04"]').parent().show();

    const fachada4A = $('#opciones-fachada .option-card[data-pre_code="FAC04"][data-valor*="A"]');
    if (fachada4A.length) {
        fachada4A.trigger('click');
    }

    // ✅ También seleccionar automáticamente las 4 recámaras al inicio
    const recamara4 = $('#opciones-habitaciones .option-card[data-id="4Recamaras"]');
    if (recamara4.length) {
        recamara4.trigger('click');
    }
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

    cambiotitle();
}


/**
 * Cambia los títulos de los acordeones según la combinación de habitación y fachada
 */
function cambiotitle() {
    const habitaciones = document.querySelector('#opciones-habitaciones .option-card.selected');
    const fachada = document.querySelector('#opciones-fachada .option-card.selected');

    const habitacionesId = habitaciones?.dataset.id || "";
    const valorFachada = fachada?.dataset.valor?.toLowerCase() || "";

    const item31 = document.getElementById("item-31");

    const heading29 = document.querySelector("#heading-29 .textAcordeon");
    const heading30 = document.querySelector("#heading-30 .textAcordeon");
    const heading31 = document.querySelector("#heading-31 .textAcordeon");

    const setHeadings = (h29 = "", h30 = "", h31 = "", showItem31 = false) => {
        if (heading29) heading29.textContent = h29;
        if (heading30) heading30.textContent = h30;
        if (heading31) heading31.textContent = h31;

        if (item31) {
            item31.classList.toggle("d-none", !showItem31);
        }
    };

    switch (true) {

        case (habitacionesId === "3Recamaras" && typeof es3A !== "undefined" && es3A):
            setHeadings(
                "Planta alta secundario",
                "Planta alta",
                "Planta baja",
                true
            );
            break;

        case (habitacionesId === "4Recamaras" && valorFachada.includes("3a")):
            setHeadings(
                "Planta alta",
                "Planta baja",
                "",
                false
            );
            break;

        case (habitacionesId === "2Recamaras" && valorFachada.includes("2a")):
            setHeadings(
                "Planta alta",
                "Roof",
                "Planta baja",
                true
            );
            break;

        case (
            (habitacionesId === "2Recamaras" && valorFachada.includes("b")) ||
            (habitacionesId === "1Recamara" && valorFachada.includes("b"))
        ):
            setHeadings(
                "Planta alta",
                "Planta baja",
                "Planta baja",
                false
            );
            break;

        case (habitacionesId === "1Recamara" && valorFachada.includes("a")):
            setHeadings(
                "Planta Baja",
                "Planta baja",
                "Planta baja",
                false
            );
            break;

        default:
            console.log(habitacionesId, valorFachada);
            setHeadings(
                "Planta alta",
                "Planta baja",
                "",
                false
            );
    }
}
