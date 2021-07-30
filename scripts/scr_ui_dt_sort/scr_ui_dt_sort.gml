///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////This script sorts a dtStruc so that the there are no gaps (example: so the first index can't be empty while 1 or 2 aren't/////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function scr_ui_dt_sort() {

	/// @func scr_ui_dt_sort(dtStruc)
	/// @desc sorts a dtStruc so that the there are no gaps
	/// @param dtStruc

	//Find number of non empty spots in the array

	var dtStruc = argument[0];
	var stringNumber = scr_ui_dt_find_string_number(dtStruc);
	var lastPos = scr_ui_dt_get_last_pos_with_string(dtStruc);

	for (i = 1; i < lastPos; i++){
		//find first empty
		if (dtStruc[# i,0] == "-1" && stringNumber > 0){
			//Loop and move the nearest non-empty index to the empty one
			for (a = i; a < lastPos; a++){
				if (dtStruc[# a,0] != "-1"){
					//Move to new location
					dtStruc[# i,0] = dtStruc[# a,0];
					dtStruc[# i,1] = dtStruc[# a,1];
					dtStruc[# i,2] = dtStruc[# a,2];
					dtStruc[# i,3] = dtStruc[# a,3];
					dtStruc[# i,4] = dtStruc[# a,4];
					//Delete old location
					dtStruc[# a,0] = "-1" 
					dtStruc[# a,1] = c_black; 
					dtStruc[# a,2] = false;
					dtStruc[# a,3] = false;
					dtStruc[# a,4] = -1;
					i = 0;
					stringNumber--;
					break;
				}
			}
		}
	
		//Exit the script if the dtStruc has been sorted
		if (stringNumber <= 0){
			exit;	
		}
	}








}
