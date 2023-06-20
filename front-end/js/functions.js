/**
 * Archivo para funciones genericas de la aplicación
 */

var baseURL = '../back-end/';

// Patrón para validar formato alfanumérico de al menos 5 caracteres. Source: https://code.tutsplus.com/es/tutorials/8-regular-expressions-you-should-know--net-6149
// var patt5caracteres_an = new RegExp(/^[A-Za-z0-9]{5,}$/);
// Source: https://es.stackoverflow.com/questions/364218/expresion-regular-para-validar-un-campo-que-tenga-letras-y-numeros-con-un-minimo
var patt5caracteres_an = new RegExp(/^(?=[A-Za-z ]+[0-9]|[0-9]+[A-Za-z ])[A-Za-z0-9 ]{5,}$/);

// Patrón para validar formato correo. Source: https://www.coderbox.net/blog/validar-email-usando-javascript-y-expresiones-regulares/
var pattEmail = new RegExp(/^\w+([.-_+]?\w+)*@\w+([.-]?\w+)*(\.\w{2,10})+$/);

var submit = false;

// Función base para enviar data al back-end
function postData(data, url) {
    var promise = new Promise((resolve, reject) => {
        $.ajax({
            type: "POST",
            url: baseURL+url,
            // data: {datos: JSON.stringify(data)},
            data: data,
            /*headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },*/
            success: function(result) {
                //console.log(result);
                resolve(JSON.parse(result));
            },
            error: function(result) {
                reject("error");
            }
        });
    });
    return promise.then( result => {
        return result;
    }, function(error) {
        return "Error";
    });
}

function getData(url){
    return $.ajax({
        type: "GET",
        url: baseURL+url,
        /*headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },*/
        success: function(data) {
            return data;
        },
        error: function(data) {
            return data;
        }
    });
}

// Función que recupera las regiones desde la base de datos y crea el selector correspondiente
// [V5.1]
async function getRegiones(){
    let regiones = await postData({function: 'getRegiones'}, 'forms/getter.php');
    
    let option = '<option value="null" selected>Seleccione una opción</option>';
    regiones.forEach(region => {
        option += '<option value="'+region['id']+'">'+region['region']+'</option>';
    });

    let regionSelectElement = document.getElementById('regionSelect');
    regionSelectElement.innerHTML += option;

    $('#regionSelect').selectpicker();

    document.getElementById("comunaSelect").disabled = false;
    getComunaByRegion();
}

// Función que recupera las comunas desde la base de datos (según la región elegida) y crea el selector correspondiente
// [V5.2]
async function getComunaByRegion(){
    
    let region_id = $("#regionSelect").val();
    let comunas = await postData({function: 'getComunaByRegion', data: {region_id: region_id}}, 'forms/getter.php');
    
    let option = '<option value="null" selected>Seleccione una opción</option>';
    comunas.forEach(comuna => {
        option += '<option value="'+comuna['id']+'">'+comuna['comuna']+'</option>';
    });

    let comunaSelectElement = document.getElementById('comunaSelect');
    comunaSelectElement.innerHTML = option;

    //document.getElementById("comunaSelect").selectedIndex = 0;
    //$('#comunaSelect').prop("selectedIndex", 0)

    $('#comunaSelect').selectpicker({
        noneSelectedText: "Seleccione una opción"
    });
    
    $('#comunaSelect').selectpicker('refresh');
}

// Función que recupera los candidatos desde la base de datos (según la votación activa) y crea el selector correspondiente
// [V6]
async function getCandidatos(){
    let votacion_id = $('meta[name="votacion"]').attr('content');
    let candidatos = await postData({function: 'getCandidatos', data: {votacion_id: votacion_id}}, 'forms/getter.php');
    
    let option = '<option value="null" selected>Seleccione una opción</option>';
    candidatos.forEach(candidato => {
        option += '<option value="'+candidato['id']+'">'+candidato['candidato']+'</option>';
    });

    let candidatoSelectElement = document.getElementById('candidatoSelect');
    candidatoSelectElement.innerHTML += option;

    $('#candidatoSelect').selectpicker();
}

// Función que recupera los "Cómo te enteraste" desde la base de datos y crea los checkbox correspondiente
async function getComoEnterarse(){
    let comoEnterarse = await postData({function: 'getComoEnterarse'}, 'forms/getter.php');
    
    let checkbox = '';
    comoEnterarse.forEach(comoEnterar => {
        checkbox += '<div class="form-check">'
                + '<input type="checkbox" class="form-check-input" id="'+comoEnterar['id']+'CheckHow" name="checkHow" value="'+comoEnterar['id']+'">'
                + '<label class="form-check-label" for="'+comoEnterar['id']+'CheckHow">'+comoEnterar['como']+'</label>'
                + '</div>';
    });

    let comoSeEnteroElement = document.getElementById('comoSeEntero');
    comoSeEnteroElement.innerHTML += checkbox;
}

// Función que revisa la base de datos para determinar si un usuario votó en la votación actual, usando el RUT como referencia.
async function haVotado(rut, votacion_id){
    let haVotado = await postData({function: 'haVotado', data: {rut: rut, votacion_id: votacion_id}}, 'forms/validation.php');
    return haVotado[0] == 0;
}

// Función que activará las notificaciones de error con su detalle
function markAsInvalid(notifyId, text){
    let invalidFeedback = document.getElementById(notifyId+'-invalid-feedback');
    invalidFeedback.style.display = 'block';
    invalidFeedback.innerHTML = text;

    submit = false;
}

// Función que desactivará las notificaciones de error
function markAsValid(notifyId){
    let invalidFeedback = document.getElementById(notifyId+'-invalid-feedback');
    invalidFeedback.style.display = 'none';
    invalidFeedback.innerHTML = '';
}

async function toVote(votacion_id, inputNombreApellido, inputAlias, inputRut, inputEmail, regionSelect, comunaSelect, candidatoSelect, arrayCheckbox){
    //console.log(votacion_id, inputNombreApellido, inputAlias, inputRut, inputEmail, regionSelect, comunaSelect, candidatoSelect, arrayCheckbox);

    let data = {
        votacion_id: votacion_id,
        nombreApellido: inputNombreApellido.value,
        alias: inputAlias.value,
        rut: inputRut.value,
        email: inputEmail.value,
        region: regionSelect.value,
        comuna: comunaSelect.value,
        candidato: candidatoSelect.value,
        how: arrayCheckbox
    };
    let res = await postData({function: 'toVote', data: data}, 'forms/validation.php');

    return res;
}

async function enviarVoto(e){
    // Se asumirá que no habrá errores. En caso de haberlos, cambiará a estado false.    
    submit = true;

    // Deshabilitamos el botón para votar
    document.getElementById("votarFormSubmit").disabled = true;

    // Buscamos todas los elementos a validar
    let inputNombreApellido = document.getElementById('inputNombreApellido');
    let inputAlias = document.getElementById('inputAlias');
    let inputRut = document.getElementById('inputRut');
    let inputEmail = document.getElementById('inputEmail');

    let regionSelect = document.getElementById('regionSelect');
    let comunaSelect = document.getElementById('comunaSelect');
    let candidatoSelect = document.getElementById('candidatoSelect');

    // votacion_id
    let votacion_id = $('meta[name="votacion"]').attr('content');

    // [V1] No debe quedar en Blanco.
    let inputNombreApellidoId = 'nombreApellido';
    if(checkAtLeastInput(inputNombreApellido, 1)) markAsValid(inputNombreApellidoId);
    else markAsInvalid(inputNombreApellidoId, 'El nombre no puede estar vacío.');

    // [V2] Validar que la cantidad de caracteres sea mayor a 5 y que contenga letras y números. 
    let inputAliasId = 'alias';
    if(patt5caracteres_an.test(inputAlias.value.trim())){
        markAsValid(inputAliasId);
    }else{
        markAsInvalid(inputAliasId, 'El alias debe tener al menos 5 caracteres (letras y números).');
    }

    // [V3] Deberá Validar el RUT (Formato Chile).
    let inputRutId = 'rut';
    let rut = inputRut.value.trim();
    rut = rut.replace(' ', '').replace('.', '').replace('-', '');
    // Cambia formato abcdefghij => abcdefghi-j
    if(rut.trim().length > 1) rut = rut.substr(0, rut.length-1)+'-'+rut[rut.length-1];
    inputRut.value = rut; // Actualiza el input al otro formato
    if(checkAtLeastInput(inputRut, 1)){
        markAsValid(inputRutId);
        if(rutValidation('inputRut')){ // Validación formato rut
            markAsValid(inputRutId);
            if(await haVotado(rut, votacion_id)){ // [V8] Se debe validar si el RUT ya votó.
                markAsValid(inputRutId);
            }else{
                markAsInvalid(inputRutId, 'Este RUT ya ha votado.');
            }
        }else{
            markAsInvalid(inputRutId, 'El RUT es inválido.');
        }
    }else{
        markAsInvalid(inputRutId, 'El RUT no puede ir vacío.');
    }

    // [V4] Deberá validar el correo según estándar
    let inputEmailId = 'email';
    if(pattEmail.test(inputEmail.value.trim())){
        markAsValid(inputEmailId);
    }else{
        markAsInvalid(inputEmailId, 'El correo es inválido.');
    }

    let inputRegionSelectId = 'regionSelect';
    if(checkSelected(regionSelect)){
        markAsValid(inputRegionSelectId);
    }else{
        markAsInvalid(inputRegionSelectId, 'Debe seleccionar una región.');
    }

    let inputComunaSelectId = 'comunaSelect';
    if(checkSelected(comunaSelect)){
        markAsValid(inputComunaSelectId);
    }else{
        markAsInvalid(inputComunaSelectId, 'Debe seleccionar una comuna.');
    }

    let inputCandidatoSelectId = 'candidatoSelect';
    if(checkSelected(candidatoSelect)){
        markAsValid(inputCandidatoSelectId);
    }else{
        markAsInvalid(inputCandidatoSelectId, 'Debe seleccionar un candidato.');
    }

    // [V7] Checkbox “Como se enteró de Nosotros”: Debe elegir al menos dos opciones.
    inputHowId = 'How';
    if(checkAtLeastCheckbox('checkHow', 2)){
        markAsValid(inputHowId);
    }else{
        markAsInvalid(inputHowId, 'Debe elegir al menos 2 opciones.');
    }

    // Habilitamos el botón para votar
    document.getElementById("votarFormSubmit").disabled = false;

    if(submit){
        var arrayCheckbox = []
        var checkboxes = document.querySelectorAll('input[name="checkHow"]:checked')

        for (var i = 0; i < checkboxes.length; i++) {
            arrayCheckbox.push(checkboxes[i].value)
        }

        let res = toVote(votacion_id, inputNombreApellido, inputAlias, inputRut, inputEmail, regionSelect, comunaSelect, candidatoSelect, arrayCheckbox);
        if(res[0]){
            Swal.fire({
                icon: 'success',
                title: 'Voto Emitido',
                text: 'Serás redirigido a otra página.',
            });
        }else{
            Swal.fire({
                icon: 'error',
                title: 'Se produjo un error al momento de votar',
                text: res[1],
            });
        }
    }else{
        Swal.fire({
            icon: 'error',
            title: 'Error al votar',
            text: 'Se encontraron inconsistencias en el formulario.',
        });
    }
}