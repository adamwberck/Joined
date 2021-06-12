///@ func vector_product
///@ param matrick
///@ param vector
function vector_product(argument0, argument1) {
	var mat0 = argument0;
	var mat1 = argument1;
	var a = mat0[0,0]*mat1[0]+mat0[0,1]*mat1[1];
	var b = mat0[1,0]*mat1[0]+mat0[1,1]*mat1[1];
	var r_mat; r_mat[0] = a;r_mat[1]=b;
	return r_mat;

}
