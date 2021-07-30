/// @func scr_ui_draw_9Slice(tilesToRight,tilesDown,startX,startY,sprite,bgCol)
/// @desc draws a standard ui box
/// @param tilesToRight
/// @param tilesDown
/// @param startX
/// @param startY
/// @param sprite
/// @param bgCol 
function scr_ui_draw_9Slice() {

	var rightTiles = argument[0];
	var downTiles = argument[1];
	var startX = argument[2];
	var startY = argument[3];
	var spr = argument[4];
	var backGroundCol = argument[5]; 

	//draw back ground
	bottomRightX = startX + 16 + (16 * rightTiles) - 2;
	bottomRightY = startY + 16 + (16 * downTiles) + 8;
	draw_set_colour(backGroundCol);
	draw_rectangle(startX + 1, startY + 1, bottomRightX + 16, bottomRightY + 4, 0);
	draw_set_colour(c_white);

	//////Draw ui tiles
	//Draw top left corner tile
	draw_sprite(spr, 0, startX, startY);

	//draw connecting tiles to the right top corner 
	var xx = startX + 16;
	repeat(rightTiles){
	    draw_sprite(spr, 4, xx, startY);
	    xx += 16;
	}

	//Draw right corner tile
	draw_sprite(spr, 1, startX + (16 * rightTiles) + 16, startY);

	//Draw down left connecting tiles
	var yy = startY + 16;
	repeat(downTiles){
	    draw_sprite(spr, 5, startX, yy);
	    yy += 16;    
	}

	//Draw bottom left ui tile
	draw_sprite(spr, 2, startX, startY + (16 * downTiles) + 16); 

	//Draw right down connecting tiles 
	var yyy = startY + 16;
	repeat(downTiles){
	    draw_sprite(spr, 6, startX + 16 + (16 * rightTiles) + 12, yyy);
	    yyy += 16;
	}

	//Draw bottom right ui corner tile
	draw_sprite(spr, 3, startX + 16 + (16 * rightTiles), startY + 16 + (16 * downTiles));

	//Draw bottom connecting tiles
	var xxx = startX + 16;
	repeat(rightTiles){
	    draw_sprite(spr, 7, xxx, startY + 16 + (16 * downTiles) + 12);
	    xxx += 16;
	}




}
