/// @func scr_ui_dt_find_number_of_words_in_string(str)
/// @desc returns the number of words that are in the given string
/// @param string
function scr_ui_dt_find_number_of_words_in_string() {

	var str = argument[0];

	var stringCurrent = str;
	var stringLength = string_length(stringCurrent);
	var words = 0;

	//Check to see if the string is longer than the max width allowed on one line

	//Loop through the characters in the sting to find the number of words
	for (a = 1; a <= stringLength; a++;){ //string_char_at starts at 1, not 0, in case you forgot
		//Find the start of the word
		if (string_char_at(stringCurrent, a) != " " && (string_char_at(stringCurrent, a - 1) == " " || a == 1)){
			//If the word is only 1 character long 
			if (string_char_at(stringCurrent, a + 1) == " " || string_char_at(stringCurrent, a + 1) == ""){
				words++;
			}
		}else if (string_char_at(stringCurrent, a) != " "  && (string_char_at(stringCurrent, a + 1) == " " || string_char_at(stringCurrent, a + 1) == "")){
			//Find the end of the word 
			words++;
		}
	}

	return words;




}
