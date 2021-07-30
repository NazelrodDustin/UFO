/// @func sm(var1,...)
/// @param var1
/// @param ...

function sm() {
	var str = "";

	for(var i = 0; i < argument_count; i++){
		str = str + string(argument[i]) + "#";
	}

	show_message(str);
}
