define([], function () {

    var getPosts = function (callback) {
        fetch("api/posts")
            .then(function (response) {
                return response.json();
            })
            .then(callback);
    };

    return {
        getPosts
    }

});