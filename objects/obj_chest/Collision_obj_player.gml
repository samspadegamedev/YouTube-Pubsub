/// @description Chest

if (state == 0) {
	if (keyboard_check_pressed(vk_shift)) {
		sprite_index = loot_box_anim_opening_strip_6;
		image_index = 0;
		state = 1;
		pubsub_publish("Chest Opened", id);
	}
}

