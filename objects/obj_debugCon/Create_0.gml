global.doubleClick = 0;
doubleClickTimer = 0;
global.leftClickHoldTimer = 0;
global.rightClickHoldTimer = 0;
global.devMode = false;
global.doubleClickLeft = false;
global.doubleClickLeftTimer = 0;
global.doubleClickTimer = 0;
global.doubleClick = 0;
global.uiBgColor = make_colour_rgb(75, 85, 88);
globalDebugWindow = noone;
debugLayer = layer_get_id("Instances");

//Fonts
global.fontDmg = font_add_sprite(spr_ftSmall, ord(" "), true, 1);
draw_set_font(global.fontDmg);

#region optionBox enum

enum OPTION_BOX {
	equipItem,
	unequipItem,
	dropItem,
	moveItem
}

enum GLOBAL_INFO_BOX_OPTION_TYPES{
	workerSelect,
	workerPickUp,
	workerResourceTarget,
	workerTransferItemsToStorage,
	workerResourceDropOff,
	workerDropItem,
	workerEquipItem,
	workerUnequipItem,
	workerDepositItemToStorage,
	structureDestroyItemFromStorage,
	structureTransferItemToWorker,
	unitAttack,
	none
}

#endregion




