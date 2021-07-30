/// @func sdbm(var1, ...)
/// @param var1
/// @param ...

function sdbm() {
	var str = "";

	for(var i = 0; i < argument_count; i++){
		str = str+string(argument[i]) + "#"
	}

	show_debug_message(str)
}
