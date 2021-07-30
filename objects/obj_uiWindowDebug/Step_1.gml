if (!populatedLayoutArray && instance_exists(debugInstance)){
	var debugInstanceName = object_get_name(debugInstance.object_index);
	var fullLayoutPath = working_directory + "Debug Windows/Layouts/" + debugInstanceName + "/";
	
	if (directory_exists(fullLayoutPath)){
		var firstLayoutFile = file_find_first(fullLayoutPath + "*.aug", 0); 
		
		if (firstLayoutFile != ""){
			var layoutFileLen = string_length(firstLayoutFile);
			firstLayoutFile = string_copy(firstLayoutFile, 1, layoutFileLen - 4);
			layoutArray[0] = firstLayoutFile;
			layoutArraySize ++;
			
			var layoutArrayLen = array_length(layoutArray);
			
			for (i = 1; i < layoutArrayLen; i++){
				var layoutFileName = file_find_next();
				
				if (layoutFileName != ""){
					layoutFileLen = string_length(layoutFileName);
					layoutFileName = string_copy(layoutFileName, 1, layoutFileLen - 4);
					layoutArray[i] = layoutFileName;
					layoutArraySize ++;
				}else{
					break;	
				}
			}
			
			file_find_close();
		}
	}
	
	populatedLayoutArray = true;
}else if (!instance_exists(debugInstance)){
	instance_destroy();	
}