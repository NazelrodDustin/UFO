event_inherited();
///Window setup

//Window Size
windowWidth = 15;
windowHeight = 20;
windowX = x;
windowY = y;

image_xscale = windowWidth + 1;
backingInstance.image_xscale = windowWidth + 2;
backingInstance.image_yscale = windowHeight + 2;

centeredText = "Debug Window";
centeredTextX = (((windowWidth + 2) * 16) / 2) - (string_width(centeredText) / 2);

initialNameUpdate = true;

hasScrollingElement = true;
scrollingSurface = -1;
scrollingSurfaceWidth = 230;
scrollingSurfaceHeight = 500;
scrollingSurfacePortWidth = scrollingSurfaceWidth;
scrollingSurfacePortHeight = 290;
scrollingSurfacePortX = 20;
scrollingSurfacePortY = 40;
scrollingSurfaceDrawX = 0;
scrollingSurfaceDrawY = 0;
scrollingSurfaceUpdate = true;
scrollingPortToSurfaceRatio =  scrollingSurfacePortHeight / scrollingSurfaceHeight;
scrollBarHeight = 197;
scrollBarY = 40;

slotHighlightX = 0;
slotHighlightY = 0;

debugInstance = noone;

variableWatchListInitialSize = 100;

for (i = 0; i < variableWatchListInitialSize; i++){
	debug_window_clear_watchlist_slot(i);
}

varWatchListSize = 0;

addVariableString = "-";
addingNewVariable = false;
variableListDs = -1;

addingNewComment = false;
addCommentString = "";
addCommentSlot = -1;

variableUpdateRate = 3;
variableUpdateTimer = 0;

variableSlotOptionBox = noone;
variableSlotForOptionBox = -1;

variableSlotChangingValue = false;
variableSlotToChange = -1;
variableSlotChangeCurrentValue = -1;

autoCompleteOptionBox = noone;

slotThatMouseIsOver = -1;

setVariableNumber = function(){
	for (i = 0; i < variableWatchListInitialSize; i++){
		if (varWatchList[i,0] != "-00"){
			varWatchListSize ++;
		}else{
			break;	
		}
	}
}

slotLinesToDraw = varWatchListSize;

dtUpdate = false;

itemStatBox = -1;

currentNumberOfItemsBeingDisplayed = 0;

alphaForInputs = 0;
addingSineThing = 0;

xxRefresh = x;
yyRefresh = y;

mouseXOffsetForOptionBoxes = 0;

currentScreen = "watchList";

for (i = 0; i < 50; i++){
	layoutArray[i] = "-00";	
}

savingLayout = false;

layoutArraySize = 0;
populatedLayoutArray = false;
itemSlotOptionBox = noone;









