///Start dragging
dragging = true;

xOff = (mouse_x - x);
yOff = (mouse_y - y);

global.UiWindowSelected = id;
globalSelectedDepthUpdate = true;
////show_debug_message(string(global.UiWindowSelected));
