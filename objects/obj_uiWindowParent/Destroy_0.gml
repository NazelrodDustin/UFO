
if (instance_exists(myButton)){
	myButton.myWindow = noone;
	myButton.windowOpen = false;
}

//scrollingsurface 

if (surface_exists(scrollingSurface)){
	surface_free(scrollingSurface);	
}

