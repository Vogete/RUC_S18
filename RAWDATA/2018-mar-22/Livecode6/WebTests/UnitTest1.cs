using DataService;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System;
using WebService;
using WebService.Controllers;
using Xunit;

namespace WebTests
{
    public class UnitTest1
    {

        [Fact]
        public void GetProduct_ValidProuctId_NotFound()
        {
            var mapper = Startup.CreateMapper();
            var dataService = new Mock<IDataService>();
            dataService.Setup(x => x.GetProduct(It.IsAny<int>()))
                .Returns(new DomainModel.Product());
            var urlHelper = new Mock<IUrlHelper>();


            var ctrl = new ProductsController(dataService.Object, mapper);
            ctrl.Url = urlHelper.Object;

            var result = ctrl.GetProduct(1);
            
            Assert.IsType<OkObjectResult>(result);

        }

        [Fact]
        public void GetProduct_InvalidProuctId_NotFound()
        {
            var mapper = Startup.CreateMapper();
            var dataService = new Mock<IDataService>();

            var ctrl = new ProductsController(dataService.Object, mapper);

            var result = ctrl.GetProduct(-1);

            Assert.IsType<NotFoundResult>(result);

        }
    }
}
