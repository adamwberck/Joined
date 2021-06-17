// Compress String that has no caps
function special_hex(list){
	list[|15] = "F"
	list[|14] = "E"
	list[|13] = "D"
	list[|12] = "C"
	list[|11] = "B"
	list[|10] = "A"
	list[|7] = "T";list[|8] = "Y";list[|9] = "U";
	list[|4] = "G";list[|5] = "H";list[|6] = "J";
	list[|1] = "K";list[|2] = "N";list[|3] = "M";
	list[|0] = "I";
}