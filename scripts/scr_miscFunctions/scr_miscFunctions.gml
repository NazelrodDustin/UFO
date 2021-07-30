enum INDICATOR {
	valueString,
	valueReal,
	valueOneDArray,
	valueTwoDArray,
}

/// @func string_has_letters(string)
/// @desc Returns true if the inputed string contains a letter
/// @param {string} string

function string_has_letters(string) {
	string = string_letters(string);

	return (string != "");
}

//Functions that manipulate arrays

#region array_add

/// @func array_add(arrayVar, replaceVal, newVal) 
/// @desc Finds the first index of a 1D array containing an inputed value and replaces in with another value
/// @param arrayVar
/// @param replaceVal
/// @param newVal

function array_add(arrayVar, replaceVal, newVal){
	var arraySize = array_length(arrayVar);
	
	for (i = 0; i < arraySize; i++){
		if (arrayVar[i] == replaceVal){
			arrayVar[@ i] = newVal;
			break;
		}
	}
}

#endregion

#region array_find_number_of_dimensions

/// @func array_find_number_of_dimensions(array) 
/// @desc Finds the number of dimensions an array has
/// @param array

function array_find_number_of_dimensions(array){
    var test = array;
    var dims = 1;
    
    while(is_array(test[0])){
        test = test[0];
        dims++;
    }
    
    return dims;
}

#endregion

#region array_sort_1d

/// @func array_sort_1d(valToSortOut, array)
/// @desc sorts a given value out of an array leaving no gaps
/// @param valToSortOut
/// @param array

function array_sort_1d(valToSortOut, array) {
	if (!is_array(array)){
		show_debug_message("That's not an array bro.");
		exit; //Exit the script if the inputed array is not actually an array	
	}

	var arrayLength = array_length(array);

	//Find number of non empty spots in the array
	var indexesToSort = 0;
	for (i = 0; i < arrayLength; i++){
		if (array[@ i] != valToSortOut){
			indexesToSort++;
		}
	}

	for (i = 0; i < arrayLength; i++){
		//find first empty
		var arrayVal = array[@ i];
	
		if (arrayVal == valToSortOut && indexesToSort > 0){
			//Loop and move the nearest non-empty index to the empty one
			for (a = i; a < arrayLength; a++){
				var arrayValA = array[@ a];
			
				if (arrayValA != valToSortOut){
					//Move to new location
					array[@ i] = arrayValA;
					//Delete old location
					array[@ a] = valToSortOut; 
					i = 0;
					indexesToSort--;
					break;
				}
			}
		}
	
		//Exit the script if the structure has been sorted
		if (indexesToSort <= 0){
			exit;	
		}
	}
}

#endregion

#region array_find_index_with_value

/// @func array_find_index_with_value(value, array)
/// @desc finds the first index within an array with the given value or -1 if none can be found
/// @param value
/// @param array
function array_find_index_with_value(value, array) {
	if (!is_array(array)){
		//show_debug_message("That's not an array bro.");
		exit; //Exit the script if the inputed array is not actually an array	
	}

	var arrayLength = array_length(array);

	for (arrayLoopI = 0; arrayLoopI < arrayLength; arrayLoopI++){
		if (array[arrayLoopI] == value){
			return arrayLoopI;	
		}
	}

	return -1;
}

#endregion

/// @func scr_array_sort_2d(valueToLookFor, arrayId)
/// @desc sorts an array so that the there are no "empty" slots
/// @param valueToLookFor
/// The value to look for in the 0 index of the second demension to indicate that the 1st demension index is "empty"
/// @param arrayId

function scr_array_sort_2d() {
	//Find number of non empty spots in the array
	var valueToLookFor = argument[0];
	var arrayId = argument[1];
	var arrayHeight = array_height_2d(arrayId);
	var arrayLength = array_length_2d(arrayId, 0);

	var nonEmptyIndexes = 0;

	for (i = 0; i < arrayHeight; i++){
		if (arrayId[i, 0] != valueToLookFor){
			nonEmptyIndexes++;
		}else if (i > arrayHeight){
			break;
		}
	}

	var lastNotEmptyIndex = 0

	for (i = 0; i < arrayHeight; i++){
		//find first empty
		if (arrayId[i, 0] != valueToLookFor){
			lastNotEmptyIndex = i;
		}else if (i > arrayHeight){
			break;
		}
	}

	//Find first "empty" index and fill a temp DS with it to use when sorting
	var emptySlotTemp = ds_grid_create(2,arrayLength);

	for (i = 0; i < arrayHeight; i++){
		if (arrayId[i,0] == valueToLookFor){
			for (a = 0; a < arrayLength; a++){
				emptySlotTemp[# 0,a] = arrayId[i,a]; 	
			}
		
			break;
		}
	}

	for (i = 0; i < lastNotEmptyIndex; i++){
		//find first empty
		var arrayIndexValue = arrayId[i,0];
	
		if (arrayIndexValue == valueToLookFor && nonEmptyIndexes > 0){
			//Loop and move the nearest non-empty index to the empty one
			for (a = i; a < lastNotEmptyIndex + 1; a++){
				if (arrayId[a,0] != valueToLookFor){
					//Move to new location
					for (k = 0; k < arrayLength; k++){
						arrayId[@ i,k] = arrayId[a,k];
					}
				
					//Delete old location
					for (k = 0; k < arrayLength; k++){
						arrayId[@ a,k] = emptySlotTemp[# 0,k];
					}

					i = 0;
					nonEmptyIndexes--;
					break;
				}
			}
		}
	
		//Exit the script if the array has been sorted
		if (nonEmptyIndexes <= 0){
			if (ds_exists(emptySlotTemp, ds_type_grid)){
				ds_grid_destroy(emptySlotTemp);		
			}
		
			exit;	
		}
	}
}

/// @func	file_bin_write_real(file);
/// @desc	Writes a real value as bytes of data.
/// @param  file The file to write the data to

function file_bin_read_real(file) {
	var length = file_bin_read_byte(file);
	var data = 0x00;

	for (var i = 0; i < length; i++){
		data = data | (file_bin_read_byte(file) << (i * 8));
	}

	return data;
}

/// @func	file_bin_write_string(file);
/// @desc	Reads a string from a binary file.
/// @param  File 
/// The file to write the data to

function file_bin_read_string(file) {
	var length = file_bin_read_byte(file);
	var data = "";

	for (var i = 0; i < length; i++){
		data = data + chr(file_bin_read_byte(file));
	}

	return data;
}

/// @func	file_bin_write_real(file);
/// @param  file The file to write the data to

function file_bin_read_type(file) {
	return (file_bin_read_byte(file));
}

/// @func	file_bin_write_real(file, data);
/// @desc	Writes a real value as bytes of data.
/// @param  file The file to write the data to
/// @param	{string} data The string to break down to binary data.

function file_bin_write_real(file, data) {
	var length = 1 + (data > 255 ? 1 : 0) + (data > 65535 ? 1 : 0) + (data > 16777215 ? 1 : 0);

	file_bin_write_byte(file, INDICATOR.valueReal);
	file_bin_write_byte(file, length);

	for (var i = 0; i < length; i++){
		var writeByte = (data >> (i * 8) & 0xFF);
		file_bin_write_byte(file, writeByte);
	}
}

/// @func	file_bin_write_string(file, data);
/// @desc	Breaks a string down to individual bytes then writes them to a binary file.
/// @param  file The file to write the data to
/// @param	{string} data The string to break down to binary data.

function file_bin_write_string(file, data) {
	var length = string_length(data);

	file_bin_write_byte(file, INDICATOR.valueString);
	file_bin_write_byte(file, length);

	for (var i = 0; i < length; i++){
		file_bin_write_byte(file, string_byte_at(data, i + 1));
	}
}


