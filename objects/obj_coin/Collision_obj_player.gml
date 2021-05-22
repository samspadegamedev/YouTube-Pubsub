/// @description Coin


if (state == 0) {
	sprite_index = coin_pickup_anim_strip_6;
	image_index = 0;
	state = 1;
	pubsub_publish("Coin Collected");
}