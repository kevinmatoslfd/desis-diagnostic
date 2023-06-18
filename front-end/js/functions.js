/**
 * Archivo para funciones genericas de la aplicación
 */

let baseURL = '../back-end/';

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

async function getRegiones(){
    let regiones = await postData({function: 'getRegiones'}, 'forms/getter.php');
    
    let option = '';
    regiones.forEach(region => {
        option += '<option value="'+region['id']+'">'+region['region']+'</option>';
    });

    let regionSelectElement = document.getElementById('regionSelect');
    regionSelectElement.innerHTML += option;

    $('#regionSelect').selectpicker();

    getComunaByRegion();
}

async function getComunaByRegion(){
    let region_id = $("#regionSelect").val();
    let comunas = await postData({function: 'getComunaByRegion', data: {region_id: region_id}}, 'forms/getter.php');
    
    let option = '';
    comunas.forEach(comuna => {
        option += '<option value="'+comuna['id']+'">'+comuna['comuna']+'</option>';
    });

    let comunaSelectElement = document.getElementById('comunaSelect');
    comunaSelectElement.innerHTML += option;

    $('#comunaSelect').selectpicker();
}

async function getCandidatos(){
    let votacion_id = $('meta[name="votacion"]').attr('content');
    let candidatos = await postData({function: 'getCandidatos', data: {votacion_id: votacion_id}}, 'forms/getter.php');
    
    let option = '';
    candidatos.forEach(candidato => {
        option += '<option value="'+candidato['id']+'">'+candidato['candidato']+'</option>';
    });

    let candidatoSelectElement = document.getElementById('candidatoSelect');
    candidatoSelectElement.innerHTML += option;

    $('#candidatoSelect').selectpicker();
}

async function getComoEnterarse(){
    let comoEnterarse = await postData({function: 'getComoEnterarse'}, 'forms/getter.php');
    
    let checkbox = '';
    comoEnterarse.forEach(comoEnterar => {
        checkbox += '<div class="form-check">'
                + '<input type="checkbox" class="form-check-input" id="'+comoEnterar['id']+'CheckHow" value="'+comoEnterar['id']+'">'
                + '<label class="form-check-label" for="'+comoEnterar['id']+'CheckHow">'+comoEnterar['como']+'</label>'
                + '</div>';
    });

    let comoSeEnteroElement = document.getElementById('comoSeEntero');
    comoSeEnteroElement.innerHTML += checkbox;
}