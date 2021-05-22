/// @description Metadata Manager


pubsub_subscribe("Coin Collected", function(){
	global.total_coins_collected += 1;
});

pubsub_subscribe("Chest Opened", function(){
	global.total_chests_collected += 1;
});

pubsub_subscribe("Player Died", function(){
	global.total_deaths += 1;
});
