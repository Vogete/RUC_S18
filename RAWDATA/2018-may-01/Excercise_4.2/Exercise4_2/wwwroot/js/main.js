(function () {
   
    require.config({
        baseUrl: 'js',
        paths: {
            knockout: 'lib/knockout/dist/knockout',
            jquery: 'lib/jQuery/dist/jquery.min'
        }
    });
    
    require([], function () {
        console.log("hello require");
    });

    require(['knockout', 'my'], function (ko, vm) {
        ko.applyBindings(vm);
    });


})();
