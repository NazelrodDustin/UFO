///Delete window

if (instance_exists(myWindow)){
	if (!myWindow.scrollBarDragging){
	    with(myWindow){
	        instance_destroy();
	    }
		instance_destroy();
	}
	
	global.typing = false;
}else{
    instance_destroy();
}

