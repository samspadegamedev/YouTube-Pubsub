/// @description Gameplay Manager


global.coins = 0;
global.lives_remaining = 9;


pubsub_subscribe("Player Died", function(){
	global.lives_remaining -= 1;
});

pubsub_subscribe("Coin Collected", function(){
	global.coins += 1;
});
