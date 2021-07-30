/// @func scr_ui_draw_select_box(tilesToRight, tilesDown, startX, startY)
/// @param rightTiles
/// @param downTiles
/// @param startX
/// @param startY
function scr_ui_draw_select_box() {
	var rightTiles = argument[0];
	var downTiles = argument[1];
	var startX = argument[2];
	var startY = argument[3];

	//draw back ground
	bottomRightX = startX + 4 + (4 * rightTiles) - 0.5;
	bottomRightY = startY + 4 + (4 * downTiles) + 4;

	//////Draw ui tiles
	//Draw top left corner tile
	draw_sprite(spr_selectorP1, 1, startX, startY);

	//Draw right corner tile
	draw_sprite(spr_selectorP1, 2, startX + (4 * rightTiles) + 4, startY);

	//Draw bottom left ui tile
	draw_sprite(spr_selectorP1, 4, startX, startY + (4 * downTiles) + 4); 

	//Draw bottom right ui corner tile
	draw_sprite(spr_selectorP1, 3, startX + 4 + (4 * rightTiles),startY + 4 + (4 * downTiles));

}
