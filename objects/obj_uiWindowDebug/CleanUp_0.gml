/// @desc destroy ds

//Destroy the different comment dsGrids
for (i = 0; i < varWatchListSize; i++){
	var commentStringOrDsGridId = varWatchList[i,6];
	
	if (commentStringOrDsGridId != "" && !string_has_letters(string(commentStringOrDsGridId))){
		if (ds_exists(commentStringOrDsGridId, ds_type_grid)){
			ds_grid_destroy(commentStringOrDsGridId);		
		}
	}
}

if (instance_exists(autoCompleteOptionBox)){
	instance_destroy(autoCompleteOptionBox);	
}


