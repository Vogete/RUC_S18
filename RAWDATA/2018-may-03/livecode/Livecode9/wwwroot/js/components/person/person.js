define(['knockout'], function(ko) {
    return function (params) {
        var firstName = ko.observable("Peter");
        return {
            firstName
        };

    };



});
