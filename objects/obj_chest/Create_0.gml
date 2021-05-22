/// @description Chest

state = 0;

pubsub_subscribe("Chest Opened", function(_id) {
	if (id != _id) {
		instance_destroy();
	}
});

