using ASP_NET_Core_Web_Introduction.Domain;
using ASP_NET_Core_Web_Introduction.Models;
using ASP_NET_Core_Web_Introduction.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ASP_NET_Core_Web_Introduction.Controllers
{
    [Route("api/persons")]
    public class PersonsController : Controller
    {
        IDataService _dataService;

        public PersonsController(IDataService dataService)
        {
            _dataService = dataService;
        }

        [HttpGet]
        public IActionResult GetPersons()
        {
            IEnumerable<PersonListModel> persons = _dataService.GetPersons().Select(x =>
            {
                var model = new PersonListModel { Name = x.Name };
                model.Url = Url.Link(nameof(GetPerson), new { Id = x.Id });

                return model;
            }
            );
            return Ok(persons);
        }

        [HttpGet("{id}", Name = nameof(GetPerson))]
        public IActionResult GetPerson(int id)
        {
            Person person = _dataService.GetPerson(id);
            if (person == null)
            {
                return NotFound();
            }

            
            var model = new PersonModel
            {
                URL = Url.Link( nameof(GetPerson), new { Id = person.Id } ),
                Name = person.Name,
                Age = person.Age
            };

            return Ok(model);
        }


        [HttpPost]
        public IActionResult CreatePerson([FromBody] CreatePersonModel model)
        {
            if (model == null)
            {
                return BadRequest();
            }

            var person = new Person
            {
                Name = model.Name,
                Age = model.Age
            };

            _dataService.CreatePerson(person);

            return Ok(person);
        }
    }
}
