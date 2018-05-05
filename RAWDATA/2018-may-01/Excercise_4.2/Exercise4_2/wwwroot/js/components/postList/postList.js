define(['knockout', 'services/dataService', 'postman'], function (ko, ds, postman) {
    return function (params) {
        var selectedComponent = ko.observable("post");
        var selectedParams = ko.observable({ post: { title: ko.observable('Title here') } });

        var posts = ko.observableArray([]);

        ds.getPosts(function (data) {
            posts(data);
        });

        debugger;        

        return {
            posts,
            selectedComponent
       }
    };
});