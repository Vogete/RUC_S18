using Microsoft.AspNetCore.Mvc;
using System.Linq;
using DataService;
using DomainModel;
using WebService.Models;
using System;
using AutoMapper;

namespace WebService.Controllers
{
    [Route("api/products")]
    public class ProductsController : Controller
    {
        IDataService _dataService;
        IMapper _mapper;

        public ProductsController (IDataService dataService, IMapper mapper)
        {
            _dataService = dataService;
            _mapper = mapper;
        }

        [HttpGet(Name = nameof(GetProducts))]
        public IActionResult GetProducts(PagingInfo pagingInfo)
        {

            // This could be refactored too :)
            var products = _dataService.GetProducts(pagingInfo.Page, pagingInfo.PageSize).Select(x =>
            {
                var model = new ProductListModel
                {
                    Name = x.ProductName,
                    Category = x.CategoryName
                };
                                
                model.Url = Url.Link(nameof(GetProduct), new { x.Id });
                return model;
            });

            return Ok(products);
        }

        [HttpGet("{id}", Name = nameof(GetProduct))]
        public IActionResult GetProduct(int id)
        {
            Product product = _dataService.GetProduct(id);
            if (product == null)
            {
                return NotFound();
            }

            // This can be replaced with Automapper (see below)
            var model = new ProductModel
            {
                Url = Url.Link(nameof(GetProduct), new { product.Id }),
                Name = product.Name,
                UnitPrice = product.UnitPrice,
                Category = product.Category.Name
            };

            // Automapper (nuget package)
            //var model = _mapper.Map<ProductModel>(product);

            return Ok(product);
        }



    }
}
