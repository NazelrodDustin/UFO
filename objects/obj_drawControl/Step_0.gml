/// @description Insert description here
// You can write your code in this editor

if (global.showCantPlaceMsg){
	timer--;
	if (timer < 0){
		global.showCantPlaceMsg = false;	
	}
}else{
	timer = 180;	
}