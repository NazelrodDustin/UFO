/// @func scr_ui_dt_add_string_no_id(string, color, clickable?, newLine? dtStrunc)
/// @desc Adds a string to an existing dynamic text struc but DOES NOT return an id
/// @param string 
/// @param color 
/// @param clickable? 
/// @param newLine 
/// @param dtStruc 
function scr_ui_dt_add_string_no_id() {

	var str = string(argument[0]);
	var color = argument[1];
	var clickable = argument[2];
	var newLine = argument[3];
	var dtStruc = argument[4];
	var wordsAdded = 0;

	if (ds_exists(dtStruc, ds_type_grid)){
		var dtHeight = dtStruc[# 0,0];
	
		//Find the next index in the dtStruc and add the string
		for (loopI = 1; loopI < dtHeight; loopI++){
			if (dtStruc[# loopI,0] == "-1"){
				var stringCurrent = str;
				var stringLength = string_length(stringCurrent);
				//Check to see if the string is longer than the max width allowed on one line

				//Loop through the characters in the sting to find the number of words
				for (a = 1; a <= stringLength; a++;){ //string_char_at starts at 1, not 0, in case you forgot
					//Find the start of the word
					if (string_char_at(stringCurrent, a) != " " && (string_char_at(stringCurrent, a - 1) == " " || a == 1)){
						var firstLetter = a;	
						//If the word is only 1 character long , copy it 
						if (string_char_at(stringCurrent, a + 1) == " " || string_char_at(stringCurrent, a + 1) == ""){
							for (b = 1; b < dtHeight; b++){
								if (dtStruc[# b,0] == "-1"){
									dtStruc[# b,0] = string_copy(stringCurrent, firstLetter, a - firstLetter + 1);
									//show_message(string_copy(stringCurrent, firstLetter, a - firstLetter + 1));
									dtStruc[# b,1] = color; 
									dtStruc[# b,2] = clickable;
									dtStruc[# b,4] = -1;
									//Only break for the first word
									if (wordsAdded == 0){
										dtStruc[# b,3] = newLine;	
									}else{
										dtStruc[# b,3] = false;		
									}
									wordsAdded++;
									break;
								}
							}	
						}
					}else if (string_char_at(stringCurrent, a) != " "  && (string_char_at(stringCurrent, a + 1) == " " || string_char_at(stringCurrent, a + 1) == "")){
						//Find the end of the word and put it into the grid
						for (b = 1; b < dtHeight; b++){
							if (dtStruc[# b,0] == "-1"){
								dtStruc[# b,0] = string_copy(stringCurrent, firstLetter, a - firstLetter + 1);
								//show_message(string_copy(stringCurrent, firstLetter, a - firstLetter + 1));
								dtStruc[# b,1] = color; 
								dtStruc[# b,2] = clickable;
								dtStruc[# b,4] = -1;
								//Only break for the first word
								if (wordsAdded == 0){
									dtStruc[# b,3] = newLine;	
								}else{
									dtStruc[# b,3] = false;		
								}	
								wordsAdded++;
								break;
							}
						}
					}
					//Break out of the loop if all of the words have been copied
					if (string_char_at(stringCurrent, a) == ""){
						exit;	
					}
			
					if (a >= stringLength){
						exit;		
					}
				}
		
			
			}
		}
	}else{
		exit;	
	}



}
