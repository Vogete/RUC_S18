(function () {

    require.config({
        baseUrl: 'js',
        paths: {
            knockout: 'lib/knockout/dist/knockout',
            jquery: 'lib/jQuery/dist/jquery.min',
            text: 'lib/requirejs-text/text'
        }
    });

    require(['knockout'], function (ko) {
        ko.components.register("person", {
            viewModel: { require: "components/person/person" },
            template: { require: "text!components/person/person.html" }
        });
    });

    require(['knockout', 'my'], function (ko, vm) {

        ko.applyBindings(vm);
    });

})();
