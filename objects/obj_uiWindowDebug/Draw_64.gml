event_inherited();

var varWatchListArraySize = ~~(array_height_2d(varWatchList) / 20);
var yy = 50;

for (i = 0; i < varWatchListArraySize; i++){
	if (varWatchList[i,0] != "-000"){
		draw_text(600, yy, "varWatchList[" + string(i) +",0" + "] = " + varWatchList[i,0]);
		draw_text(600, yy + 8, "varWatchList[" + string(i) +",1" + "] = " + string(varWatchList[i,1]));
		draw_text(600, yy + 16, "varWatchList[" + string(i) +",2" + "] = " + string_copy(string(varWatchList[i,2]), 0, 10));
		draw_text(600, yy + 24, "varWatchList[" + string(i) +",3" + "] = " + string(varWatchList[i,3]));
		draw_text(600, yy + 32, "varWatchList[" + string(i) +",4" + "] = " + string(varWatchList[i,4]));
		draw_text(600, yy + 40, "varWatchList[" + string(i) +",5" + "] = " + string(varWatchList[i,5]));
		draw_text(600, yy + 48, "varWatchList[" + string(i) +",6" + "] = " + string(varWatchList[i,6]));
		draw_text(600, yy + 56, "varWatchList[" + string(i) +",7" + "] = " + string(varWatchList[i,7]));
		draw_text(600, yy + 64, "varWatchList[" + string(i) +",8" + "] = " + string(varWatchList[i,8]));
		
		yy += 76;
	}else{
		break;	
	}
}

var xx = 400;
yy = 80;

draw_text(xx, yy, "slotThatMouseIsOver = " + string(slotThatMouseIsOver));
draw_text(xx, yy + 12, "slotBeingDraggedIndex = " + string(slotBeingDraggedIndex));
draw_text(xx, yy + 24, "varWatchListSize = " + string(varWatchListSize));
draw_text(xx, yy + 36, "variableSlotChangingValue = " + string(variableSlotChangingValue));
draw_text(xx, yy + 48, "variableSlotToChange = " + string(variableSlotToChange));
draw_text(xx, yy + 60, "variableSlotChangeCurrentValue = " + string(variableSlotChangeCurrentValue));
draw_text(xx, yy + 72, "addingNewVariable = " + string(addingNewVariable));






