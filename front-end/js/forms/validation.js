// Función valida el rut con su cadena completa "XXXXXXXX-X"
// Source: https://gist.github.com/donpandix/f1d638c3a1a908be02d5
var Fn = {
	validaRut : function (rutCompleto) {
		if (!/^[0-9]+[-|‐]{1}[0-9kK]{1}$/.test( rutCompleto ))
			return false;
		var tmp 	= rutCompleto.split('-');
		var digv	= tmp[1]; 
		var rut 	= tmp[0];
		if ( digv == 'K' ) digv = 'k' ;
		return (Fn.dv(rut) == digv );
	},
	dv : function(T){
		var M=0,S=1;
		for(;T;T=Math.floor(T/10))
			S=(S+T%10*(9-M++%6))%11;
		return S?S-1:'k';
	}
}

// Valida si check group cumple con al menos @amount (número natural) selecciones
function checkAtLeastCheckbox(checkboxName, amount){
    if(amount > 0){ // Amount positivo
		let checkboxMarcados = document.querySelectorAll('input[name="'+checkboxName+'"]:checked').length;
        return checkboxMarcados >= amount;
    }
}

// Valida si un input cumple con al menos @amount largo
function checkAtLeastInput(inputId, amount){
	if(amount >= 0){
		return inputId.value.trim().length >= amount;
    }else{ // Caso contrario es largo negativo
		return -1;
	}
}

// Toma el RUT y lo transforma en un formato que validaRut pueda trabajarlo (abcdefghi-j)
function rutValidation(inputId){
    let rut = document.getElementById(inputId).value.trim();
	rut = rut.replace(' ', '').replace('.', '');

    return Fn.validaRut(rut);
}

// Chequea si el valor seleccionado en un <select> es nulo
function checkSelected(selectId){
	if(selectId.value == 'null' || selectId.value == null){
		return false;
	}else{
		return true;
	}
}