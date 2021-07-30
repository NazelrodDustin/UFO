/// @func scr_ui_dt_replace_string_id(newString,color,clickable?,newline?,replaceAll?,dtStruc)
/// @desc replaces the strings associated with the given ID with a new string or set of strings
/// @param newString 
/// @param color 
/// @param clickable? 
/// @param newLine?
/// @param id
/// @param dtStruc
function scr_ui_dt_replace_string_id() {

	var strNew = argument[0];
	var color = argument[1];
	var clickable = argument[2];
	var newLine = argument[3];
	var replaceId = argument[4];
	var dtStruc = argument[5];
	var replacePos = 0;
	var replaceStringNum = 0;
	var endOfDtPos = 0;
	var newStringNum = 0;

	//Loop through the dtStruc and replace the string/strings with the given new string
	if (ds_exists(dtStruc, ds_type_grid)){
		var dtHeight = ds_grid_width(dtStruc);
	
		for (loopI = 1; loopI < dtHeight; loopI ++){
			//Loop through dtStruc and find the first pos with the replaceId
			if (dtStruc[# loopI,4] == replaceId){
				replacePos = loopI;
				break;
			}
		}
		//Find the number of strings that the replaceId has
		replaceStringNum = scr_ui_dt_find_string_number_id(replaceId, dtStruc);
		newStringNum = scr_ui_dt_find_number_of_words_in_string(strNew);
		//Remove the strings to be replaced
		//Loop through the dtStruc and remove the given strings/string
		for (loopI = 1; loopI < dtHeight; loopI++;){
			if (dtStruc[# loopI,4] == replaceId && dtStruc[# loopI,0] != "-1"){
				//remove the string because it matches
				dtStruc[# loopI,0] = "-1" 
				dtStruc[# loopI,1] = c_black; 
				dtStruc[# loopI,2] = false;
				dtStruc[# loopI,3] = false;		
				dtStruc[# loopI,4] = -1;	
			}
		}
	
		scr_ui_dt_sort(dtStruc);
	
		//Go to the last string in the whole dtStruc and starting from the back, move the correct number of strings over 
		for (loopI = 1; loopI < dtHeight; loopI ++){
			if (dtStruc[# loopI,0] == "-1"){
				if (loopI == 0){
					break;	
				}else{
					endOfDtPos = loopI - 1;	
					break;
				}
			}
		}
	
		//Start moving the strings over
		for (loopI = endOfDtPos; loopI >= replacePos; loopI --){
			//Move to new location
			dtStruc[# loopI + newStringNum,0] = dtStruc[# loopI,0];
			dtStruc[# loopI + newStringNum,1] = dtStruc[# loopI,1];
			dtStruc[# loopI + newStringNum,2] = dtStruc[# loopI,2];
			dtStruc[# loopI + newStringNum,3] = dtStruc[# loopI,3];
			dtStruc[# loopI + newStringNum,4] = dtStruc[# loopI,4];
			//Delete old location
			dtStruc[# loopI,0] = "-1" 
			dtStruc[# loopI,1] = c_black; 
			dtStruc[# loopI,2] = false;
			dtStruc[# loopI,3] = false;
			dtStruc[# loopI,4] = -1;		
		}
	
		//show_message(scr_ui_dt_get_full_string(dtStruc));
		//Add the new string to the space freed
		var stringCurrent = strNew;
		var stringLength = string_length(stringCurrent);
		var wordsAdded = 0;
	
		//Loop through the characters in the sting to find the number of words
		for (a = 1; a <= stringLength; a++;){ //string_char_at starts at 1, not 0, in case you forgot
			//Find the start of the word
			if (string_char_at(stringCurrent, a) != " " && (string_char_at(stringCurrent, a - 1) == " " || a == 1)){
				var firstLetter = a;	
				//If the word is only 1 character long , copy it 
				if (string_char_at(stringCurrent, a + 1) == " " || string_char_at(stringCurrent, a + 1) == ""){
					for (b = replacePos; b < dtHeight; b++){
						if (dtStruc[# b,0] == "-1"){
							dtStruc[# b,0] = string_copy(stringCurrent, firstLetter, a - firstLetter + 1);
							//show_message(string_copy(stringCurrent, firstLetter, a - firstLetter + 1));
							dtStruc[# b,1] = color; 
							dtStruc[# b,2] = clickable;
							dtStruc[# b,4] = replaceId;
						
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
				for (b = replacePos; b < dtHeight; b++){
					if (dtStruc[# b,0] == "-1"){
						dtStruc[# b,0] = string_copy(stringCurrent, firstLetter, a - firstLetter + 1);
						//show_message(string_copy(stringCurrent, firstLetter, a - firstLetter + 1));
						dtStruc[# b,1] = color; 
						dtStruc[# b,2] = clickable;
						dtStruc[# b,4] = replaceId;
					
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
	}else{
		exit;	
	}



}
