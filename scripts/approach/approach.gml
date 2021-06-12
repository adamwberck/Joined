///@description approach
///@argument0 val
///@argument1 rate
///@argument2 final
function approach(argument0, argument1, argument2) {
	var val = argument0; var rate = argument1; var final = argument2;
	if(rate<0){
		show_error("rate less than 0",true);
	}
	return val<final ? min(val+rate,final) : max(val-rate,final) ;


}
