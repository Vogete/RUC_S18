define(['knockout', 'services/dataService'], function (ko, ds) {
    var firstName = ko.observable('Peter');
    var lastName = ko.observable('Smith');
    var showLastName = ko.observable(true);
    var selectedTemplate = ko.observable("tmp1");

    var fullName = ko.computed(function () {
        return firstName() + " " + lastName();
    });

    var changeTemplate = function () {
        if (selectedTemplate() === "tmp1") selectedTemplate("tmp2");
        else selectedTemplate("tmp1");
    }

    var names = ko.observableArray([]);

    ds.getPosts(function (data) {
        names(data);
    });

    var addName = function () {
        names.push(firstName());
        firstName("");
        lastName("");
    };

    var deleteName = function (name) {
        names.remove(name);
    };

    var canAdd = ko.computed(function () {
        return firstName().length > 0 &&
            lastName().length > 0;
    });

    return {
        firstName,
        lastName,
        fullName,
        names,
        addName,
        deleteName,
        canAdd,
        showLastName,
        selectedTemplate,
        changeTemplate
    }

    

});