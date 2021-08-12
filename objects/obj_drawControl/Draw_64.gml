var scoreString = "Score: " + string(global.score);
var middleX = (window_get_width() / 2) - (string_width(scoreString) / 2);

draw_text(middleX, 35, scoreString);
draw_text(60, 35, "Salvaged parts: " + string(global.salvageParts));