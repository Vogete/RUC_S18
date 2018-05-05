define([], function () {

    var getPosts = function (callback) {
        fetch("api/persons")
        .then(function (response) {
            return response.json();
        })
        .then(callback);
    };

    return {
        getPosts
    }


});