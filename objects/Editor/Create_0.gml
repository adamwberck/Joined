/// @description set maps
tb_map = ds_map_create();
ds_map_add(tb_map, tbGoal,edGoal);
ds_map_add(tb_map, tbHap,edHap);
ds_map_add(tb_map, tbPit , edPit);
ds_map_add(tb_map, tbSquare , edSquare);
ds_map_add(tb_map, tbWall , edWall);

str_map = ds_map_create();
ds_map_add(str_map, edGoal,"g");
ds_map_add(str_map,	edHap,"h");
ds_map_add(str_map, edPit , "p");
ds_map_add(str_map, edSquare , "s");
ds_map_add(str_map, edWall , "w");
ds_map_add(str_map, noone , "n");

str_ed_map = ds_map_create();
ds_map_add(str_ed_map, "g", edGoal);
ds_map_add(str_ed_map, "h", edHap);
ds_map_add(str_ed_map, "p", edPit);
ds_map_add(str_ed_map, "s", edSquare);
ds_map_add(str_ed_map, "w", edWall);
ds_map_add(str_ed_map, "n", noone);

str_real_map = ds_map_create();

ds_map_add(str_real_map, "g", Goal);
ds_map_add(str_real_map, "h", Square);
ds_map_add(str_real_map, "p", Pit);
ds_map_add(str_real_map, "s", Square);
ds_map_add(str_real_map, "w", Wall);
ds_map_add(str_real_map, "n", noone);
