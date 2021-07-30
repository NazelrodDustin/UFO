///This is the dynamic text system
function scr_ui_dt_create() {

	/// @func scr_ui_dt_create();
	/// @desc Creates a new dynamic text structure

	var dtWidth = 1000;
	var dtStruc = ds_grid_create(dtWidth, 15);

	///Map for values
	// dtStruc[# i,0] = "String" (string that is to be drawn) {STRING}
	// dtStruc[# i,1] = c_black (the color that that string will be drawn) {REAL}
	// dtStruc[# i,2] = false (Whether the string in that index is clickable) {BOOLEAN}
	// dtStruc[# i,3] = false (Whether the string should break to a new line or not) {BOOLEAN}
	// dtStruc[# i,4] = -1 (ID for the string) {REAL}

	///fill the grid with place holder values
	dtStruc[# 0,0] = 1000 //size
	dtStruc[# 0,1] = 0 //Largest ID

	for (i = 1; i < dtWidth; i++){
		dtStruc[# i,0] = "-1" 
		dtStruc[# i,1] = c_black; 
		dtStruc[# i,2] = false;
		dtStruc[# i,3] = false;	
		dtStruc[# i,4] = -1;	
	}

	return dtStruc;



}
