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
function checkAtLeast(idCheckGroup, amount){
    if(amount > 0){ // Amount positivo
        //swal.fire("Debes seleccionar al menos "+amount+" opciones");
    }
}

// Toma el RUT y lo transforma en un formato que validaRut pueda trabajarlo
function rutValidation(){
    let rut = $('#inputRut').val;

    let res = Fn.validaRut(rut);
}