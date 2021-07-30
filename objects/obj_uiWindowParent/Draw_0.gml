//if (live_call()) return live_result;

//Draw the window 9-slice and draw the name of the window
scr_draw_ui_box(windowWidth, windowHeight, x, y);
draw_text(x + centeredTextX, y + 8, centeredText);

//Highlight the top bar of the window so the player knows they can drag them
var mouseIsAtTheTopBarOfTheWindow = point_in_rectangle(mouse_x, mouse_y, x, y, x + ((windowWidth + 1) * 16), y + 8);

if (mouseIsAtTheTopBarOfTheWindow){	
	draw_set_alpha(.1);
	draw_rectangle(x, y, x + ((windowWidth + 1) * 16), y + 8, 0);
	draw_set_alpha(1);
}

#region Scrolling element
if (hasScrollingElement){
	if (surface_exists(scrollingSurface)){
		draw_surface_part(scrollingSurface, scrollingSurfaceDrawX, scrollingSurfaceDrawY, scrollingSurfacePortWidth, scrollingSurfacePortHeight, x + scrollingSurfacePortX, y + scrollingSurfacePortY);
	}
	
	if (scrollBarHeight >= scrollingSurfacePortHeight){
		drawScrollBar = false;	
	}
	
	if (drawScrollBar){
		//Draw scroll backing and arrows
		draw_set_alpha(.5);
		draw_rectangle_color(x + scrollingSurfacePortX + scrollingSurfacePortWidth + 2, y + scrollingSurfacePortY, x + scrollingSurfacePortX + scrollingSurfacePortWidth + 9, y + scrollingSurfacePortY + scrollingSurfacePortHeight + 0, c_gray, c_gray, c_gray, c_gray, 0);
		var col = make_color_rgb(92, 88, 106);
		draw_set_alpha(1);

		draw_rectangle_color(x + scrollingSurfacePortX + scrollingSurfacePortWidth + 2, y + scrollBarY + 0, x + scrollingSurfacePortX + scrollingSurfacePortWidth + 9, y + scrollBarY + scrollBarHeight - 0, c_gray, c_gray, c_gray, c_gray, 0);	
		var col = make_color_rgb(92, 88, 106);
	
		//Highlight scrollbar
		var scrollBarX1 = x + scrollingSurfacePortX + scrollingSurfacePortWidth + 1;
		var scrollBarX2 = x + scrollingSurfacePortX + scrollingSurfacePortWidth + 10;
		var scrollBarY1 = y + scrollBarY + 0
		var scrollBarY2 = y + scrollBarY + scrollBarHeight - 0;
	
		if (point_in_rectangle(mouse_x, mouse_y, scrollBarX1, scrollBarY1, scrollBarX2, scrollBarY2) || scrollBarDragging){
			draw_set_alpha(.3);
				draw_rectangle_color(x + scrollingSurfacePortX + scrollingSurfacePortWidth + 2, y + scrollBarY + 0, x + scrollingSurfacePortX + scrollingSurfacePortWidth + 9, y + scrollBarY + scrollBarHeight - 0, col, col, col, col, 0);		
			draw_set_alpha(1);
		}
	}
}
#endregion







