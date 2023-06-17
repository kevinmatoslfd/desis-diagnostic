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
                return result;
            },
            error: function(result) {
                return result;
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
    console.log(regiones);
}

function getComunaByRegion(){
    let region = '';
    let comunas = postData(region);
}

function getCandidatos(){
    let candidatos = postData();
}

async function getComoEnterarse(){
    let comoEnterarse = await postData({function: 'getComoEnterarse'}, 'forms/getter.php');
    option = '';
    comoEnterarse.forEach(element => {
        
    });
    console.log(comoEnterarse);
}