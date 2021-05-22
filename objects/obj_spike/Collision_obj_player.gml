/// @description Spikes

if (state == 0) {
	state = 1;
	sprite_index = trap_spikes_anim;
}

if (state == 1) && (image_index >= 3) {
	instance_destroy(obj_player);
}