/// @func scr_draw_ui_box(tilesToRight,tilesDown,startX,startY)
/// @desc draws a standard ui box
/// @param tilesToRight
/// @param tilesDown
/// @param startX
/// @param startY
function scr_draw_ui_box() {

	var rightTiles = argument[0];
	var downTiles = argument[1];
	var startX = argument[2];
	var startY = argument[3];
	var backgroundColor = make_colour_rgb(75, 85, 88); 

	//draw back ground
	bottomRightX = startX + 16 + (16 * rightTiles) - 2  ;
	bottomRightY = startY + 16 + (16 * downTiles) + 8;
	draw_set_colour(backgroundColor);
	draw_rectangle(startX + 1, startY + 1, bottomRightX + 16, bottomRightY, 0);
	draw_set_colour(c_white);

	//////Draw ui tiles
	//Draw top left corner tile
	draw_sprite(spr_uiDynamicboxTopLeft, 0, startX, startY);

	//draw connecting tiles to the right top corner 
	var xx = startX + 16;
	repeat(rightTiles){
	    draw_sprite(spr_uiDynamicBoxTop, 0, xx, startY);
	    xx += 16;
	}

	//Draw right corner tile
	draw_sprite(spr_uiDynamicBoxTopRight, 0, startX + (16 * rightTiles) + 16, startY);

	//Draw down left connecting tiles
	var yy = startY + 16;
	repeat(downTiles){
	    draw_sprite(spr_uiDynamicBoxLeft,0,startX,yy);
	    yy += 16;    
	}

	//Draw bottom left ui tile
	draw_sprite(spr_uiDynamicBoxBottomLeft,0,startX,startY + (16 * downTiles) + 16); 

	//Draw right down connecting tiles 
	var yyy = startY + 16;
	repeat(downTiles){
	    draw_sprite(spr_uiDynamicBoxRight,0,startX + 16 + (16 * rightTiles) + 8,yyy);
	    yyy += 16;
	}

	//Draw bottom right ui corner tile
	draw_sprite(spr_uiDynamicBoxBottomRight,0,startX + 16 + (16 * rightTiles),startY + 16 + (16 * downTiles));

	//Draw bottom connecting tiles
	var xxx = startX + 16;
	repeat(rightTiles){
	    draw_sprite(spr_uiDynamicBoxBottom,0,xxx,startY + 16 + (16 * downTiles) + 8);
	    xxx += 16;
	}




}
