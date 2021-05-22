/// @description Player


var _left, _right, _jump_pressed;
_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
_jump_pressed = keyboard_check_pressed(vk_space);



hsp = (_right - _left) * movement_speed;
if (hsp != 0) {
	image_xscale = sign(hsp);
} 

switch (state) {
	
	case 0:
		
		if (hsp != 0) {
			sprite_index = herochar_run_anim;
		} else {
			sprite_index = herochar_idle_anim;
		}
		
		if (_jump_pressed) && (place_meeting(x, y + 1, solid_parent)) {
			vsp = jump_speed;
			state = 1;
			break;
		}	
		if (!place_meeting(x, y + 1, solid_parent)) {
			state = 1;
			break;
		}	
		
		break;
		
	case 1:
	
		if (vsp < 0) {
			sprite_index = herochar_jump_up_anim;
		} else {
			sprite_index = herochar_jump_down_anim;
		}
	
		if (place_meeting(x, y + 1, solid_parent)) {
			state = 0;
		}
		break;
}


vsp += grav;
move_and_collide();

