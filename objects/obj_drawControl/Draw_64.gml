draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var scoreString = "Data Uploaded: " + string(global.score);
var middleX = (window_get_width() / 2);

draw_text(middleX, 35, scoreString);