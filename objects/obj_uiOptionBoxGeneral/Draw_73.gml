/// @description Draw option box

//scr_draw_ui_box(optionBoxWidth, optionBoxHeight, x + optionBoxX, y + optionBoxY);	
scr_ui_draw_9Slice(optionBoxWidth, optionBoxHeight, x + optionBoxX, y + optionBoxY, spr_ui9SliceThin, make_colour_rgb(75, 85, 88));
	
var opY = y + (optionBoxY + 10);

for (i = 0; i < optionNumber; i++){
	draw_text(x + (optionBoxX + 16), opY, optionArray[i,0]);	
	opY += 12;
}

//Debug draw border of option box
draw_set_color(c_gray);

//draw_rectangle(x + optionBoxX, y + optionBoxY, x + optionBoxX + (optionBoxWidth * 16) + 32, y + optionBoxY + (optionBoxHeight * 16) + 32, 1);
//Debug draw option regions
if (optionNumber > 1){
	for (i = 0; i < optionNumber; i++){
		draw_line(x + optionBoxX + 13, y + optionBoxY + optionArray[i,4], x + optionBoxX + (optionBoxWidth * 16) + 18, y + optionBoxY + optionArray[i,4]);
	}
}

draw_set_color(c_gray);

//Highlight the option the mouse is currently over
for (i = 0; i < optionNumber; i++){
	if ((mouse_y >= (y + optionBoxY + optionArray[i,3]) && mouse_y <= (y + optionBoxY + optionArray[i,4])) && (mouse_x <= (x + optionBoxX + (optionBoxWidth * 16) + 24) && mouse_x >= (x + optionBoxX + 8))){
		selectingWithArrows = false;
		
		draw_set_alpha(.25);
		draw_rectangle(x + optionBoxX + 6, y + optionBoxY + optionArray[i,3], x + optionBoxX + (optionBoxWidth * 16) + 32 - 8, y + optionBoxY + optionArray[i,4], 0);
		draw_set_alpha(1);
		break;
	}
}

//Selecting With arrow keys
if (selectingWithArrows){
	draw_set_alpha(.25);
	draw_rectangle(x + optionBoxX + 6, y + optionBoxY + optionArray[selectingWithArrowsPosition,3], x + optionBoxX + (optionBoxWidth * 16) + 32 - 8, y + optionBoxY + optionArray[selectingWithArrowsPosition,4], 0);
	draw_set_alpha(1);	
}

	
		
