///Stop dragging 
#region Camera variable update 
gameCameraX = 0;
gameCameraY = 0;
gameCameraW = room_width;
gameCameraH = room_height;
#endregion

dragging = 0;

xPos = x - gameCameraX;
yPos = y - gameCameraY;


////show_debug_message(string(xPos) + ", " + string(yPos));