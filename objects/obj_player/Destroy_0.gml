/// @description Player


pubsub_publish("Player Died");
instance_create_layer(x, y, layer, obj_player_death);
