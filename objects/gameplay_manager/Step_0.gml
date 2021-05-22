/// @description Gameplay Manager


if (keyboard_check_pressed(vk_space)) && (global.lives_remaining > 0) {
	if (!instance_exists(obj_player)) {
		instance_create_layer(56, 88, "Player", obj_player);
	}
}

if (keyboard_check_pressed(ord("R"))) {
	room_restart();
}
if (keyboard_check_pressed(ord("Q"))) {
	game_end();
}

