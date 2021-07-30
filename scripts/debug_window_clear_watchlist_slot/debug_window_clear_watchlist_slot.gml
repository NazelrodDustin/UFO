/// @func debug_window_clear_watchlist_slot(slotIndex)
/// @desc Clears a watchlist slot 
/// @param slotIndex

function debug_window_clear_watchlist_slot() {
	var slotIndex = argument[0];
 
	varWatchList[slotIndex,0] = "-00"; //String name of the variable
	varWatchList[slotIndex,1] = true; //If the variable is an array, this bool is whether the array indexes are collapsed or not
	varWatchList[slotIndex,2] = -1; //Array index of the 1st dimension
	varWatchList[slotIndex,3] = noone; //Instance scope
	varWatchList[slotIndex,4] = 0; //Array index of the 2nd dimension
	varWatchList[slotIndex,5] = true; //Whether the 2nd dimension of a 2d array is collapsed or not
	varWatchList[slotIndex,6] = ""; //Comment
	varWatchList[slotIndex,7] = ""; //Instance scope string
	varWatchList[slotIndex,8] = false //Whether or not a variable is a bool (can be 1, 0, or a dsGrid id for arrays)
}
