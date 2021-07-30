///general
//Window Size
windowWidth = 3;
windowHeight = 3;
windowX = x;
windowY = y;
myButton = noone;
myStruc = noone;
image_xscale += windowWidth + 1;
backingInstance = instance_create_layer(x, y, obj_debugCon.debugLayer, obj_uiWindowBacking);

if instance_exists(backingInstance){
	backingInstance.image_xscale = windowWidth + 2;
	backingInstance.image_yscale = windowHeight + 2;
	backingInstance.myWindow = id;
}

#region //Camera variable update 
gameCameraX = 0;
gameCameraY = 0;
gameCameraW = room_width;
gameCameraH = room_height;
#endregion

#region window dragging
dragging = 0;
xOff = 0;
yOff = 0;
xPos = 0;
yPos = 0;

xOff = (-50);
yOff = (200);
#endregion

//Exit button
myExit = instance_create_layer(x + (windowWidth * 16), y + 16, obj_debugCon.debugLayer, obj_uiWindowExit);
myExit.myWindow = id;

//Window title
centeredText = "Test Window";
centeredTextX = (((windowWidth + 2) * 16) / 2) - (string_width(centeredText) / 2);

//Otherr 
depthUpdate = false;
globalSelectedDepthUpdate = false;

global.UiWindowSelected = id;

#region Scrolling element
hasScrollingElement = false;
scrollingSurface = -1;
scrollingSurfaceWidth = 0;
scrollingSurfaceHeight = 0;
scrollingSurfacePortWidth = 0;
scrollingSurfacePortHeight = 0;
scrollingSurfacePortX = 0;
scrollingSurfacePortY = 0;
scrollingSurfaceDrawX = 0;
scrollingSurfaceUpdate = 0
scrollBarY = 60;
scrollBarHeight = 50;
scrollBarDragging = false;
dragStartX = 0;
dragStartY = 0;
drawScrollBar = true;
#endregion

slotHighlightX = 0;

slotBeingDragged = false;
slotBeingDraggedIndex = -1;




