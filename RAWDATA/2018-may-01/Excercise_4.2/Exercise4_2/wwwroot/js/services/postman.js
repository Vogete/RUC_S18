define([], function () {

    var subscribers = [];

    var subscribe = function (event, callback) {
        var subscriber = { event, callback };
        subscribers.push(subscriber);

        return function () {
            subscribers = subscribers.filter(s => s !== subscriber);
        };
    }

    var publish = function (event, data) {
        subscribers.forEach(function (subscriber) {
            if (subscriber.event === event) subscriber.callback(data);
        });
    }


    return {
        subscribe,
        publish
    }

});