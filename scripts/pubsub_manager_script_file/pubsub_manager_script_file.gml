// Pubsub Manager Script File


function pubsub_subscribe(_event, _func) {
    with (pubsub_manager) {
        subscribe(other.id, _event, _func);
        return true;
    }
    return false;
}

function pubsub_unsubscribe(_event) {
    with (pubsub_manager) {
        unsubscribe(other.id, _event);
        return true;
    }
    return false;
}

function pubsub_unsubscribe_all() {
	with (pubsub_manager) {
        unsubscribe_all(other.id);
        return true;
    }
    return false;
}

function pubsub_publish(_event, _data) {
    with (pubsub_manager) {
        publish(_event, _data);
        return true;
    }
    return false;
}









