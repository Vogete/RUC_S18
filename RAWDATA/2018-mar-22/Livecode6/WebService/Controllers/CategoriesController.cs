using Microsoft.AspNetCore.Mvc;
using System.Linq;
using DataService;
using DomainModel;
using WebService.Models;


namespace WebService.Controllers
{

    [Route("api/categories")]
    public class CategoriesController : Controller
    {
        IDataService _dataService;

        public CategoriesController(IDataService dataService)
        {
            _dataService = dataService;
        }

        [HttpGet]
        public IActionResult GetCategories()
        {
            var categories = _dataService.GetCategories().Select(c =>
            {
                var model = new CategoryListModel { Name = c.Name };
                model.Url = Url.Link(nameof(GetCategory), new { c.Id });
                return model;
            });
            return Ok(categories);
        }

        [HttpGet("{id}", Name = nameof(GetCategory))]
        public IActionResult GetCategory(int id)
        {
            var category = _dataService.GetCategory(id);
            if (category == null) return NotFound();

            var model = new CategoryModel
            {
                Url = Url.Link(nameof(GetCategory), new { id }),
                Name = category.Name,
                Description = category.Description
            };

            return Ok(model);
        }

        [HttpPost]
        public IActionResult CreateCategory([FromBody] CreateCategoryModel model)
        {
            if (model == null) return BadRequest();

            var category = _dataService.CreateCategory(model.Name, model.Description);

            return Ok(category);
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteCategory(int id)
        {
            if (!_dataService.DeleteCategory(id)) return NotFound();
            return NoContent();
        }

    }
}
