/// @description Pubsub Manager

/*
struct = {
    "event name" = [
        [id, func],
        ... ,
        [id, func]
    ],
    ...,
    "event name" = [
        [id, func],
        ... ,
        [id, func]    
    ]

}
*/

enum ps_event {
	inst_id		= 0,
	inst_func	= 1
}

event_struct = {};


subscribe = function(_id, _event, _func) {
    if (is_undefined(event_struct[$ _event])) {
		event_struct[$ _event] = [];
    } else if (is_subscribed(_id, _event) != -1) {
		return;
    } 
	array_push(event_struct[$ _event], [_id, _func]);
}

publish = function(_event, _data) {
	var _subscriber_array = event_struct[$ _event];
	
    if (is_undefined(_subscriber_array)) {
		return;
    }
	
	for (var i = (array_length(_subscriber_array) - 1); i >= 0; i -= 1) {
		if (instance_exists(_subscriber_array[i][ps_event.inst_id])) {
			_subscriber_array[i][ps_event.inst_func](_data);
		} else {
			array_delete(_subscriber_array, i, 1);
		}
	}
	
}


is_subscribed = function(_id, _event) {
    for (var i = 0; i < array_length(event_struct[$ _event]); i += 1) {
        if (event_struct[$ _event][i][ps_event.inst_id] == _id) {
            return i;
        }
    }  
    return -1;
}



unsubscribe = function(_id, _event) {
    if (is_undefined(event_struct[$ _event])) return;
	  
    var _pos = is_subscribed(_id, _event);
    if (_pos != -1) {
		array_delete(event_struct[$ _event], _pos, 1);
    }
    
}

unsubscribe_all = function(_id) {
	var _keys_array = variable_struct_get_names(event_struct);
	for (var i = (array_length(_keys_array) - 1); i >= 0; i -= 1) {
		unsubscribe(_keys_array[i], _id);
	}
}



remove_event = function(_event) {
    if (variable_struct_exists(event_struct, _event)) {
		variable_struct_remove(event_struct, _event);
    }
}

remove_all_events = function() {
	delete event_struct;
	event_struct = {};
}

remove_dead_instances = function() {
	var _keys_array = variable_struct_get_names(event_struct);
	for (var i = 0; i < array_length(_keys_array); i += 1) {
		var _keys_array_subs = event_struct[$ _keys_array[i]];
		for (var j = (array_length(_keys_array_subs) - 1); j >= 0; j -= 1) {
			if (!instance_exists(_keys_array_subs[j][0])) {
				array_delete(event_struct[$ _keys_array[i]], j, 1);
			}
		}
	}
}







