define(['knockout', 'postman'],
    function (ko, postman) {
        var selectedComponent = ko.observable("post-list");
        var selectedParams = ko.observable({ name: "Post List" });


        return {
            selectedComponent,
            selectedParams,
            changeComponent
        }

    });