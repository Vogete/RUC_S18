using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Livecode9.Domain
{
    public class Data
    {
        public static List<Person> Persons;
        static Data()
        {

            var data = new[] {
    //new { FirstName = "Caleb",LastName = "Foster",Age = 18,Pet = "rabbit,dog,goat" },
    //new { FirstName = "Delilah",LastName = "Oneal",Age = 23,Pet = "bird" },
    //new { FirstName = "Myles",LastName = "Espinoza",Age = 21,Pet = "" },
    //new { FirstName = "John",LastName = "Crane",Age = 29,Pet = "cat,bird,dog" },
    //new { FirstName = "Noelle",LastName = "White",Age = 25,Pet = "bird" },
    //new { FirstName = "Chase",LastName = "Gonzalez",Age = 23,Pet = "cat" },
    //new { FirstName = "Gage",LastName = "Ingram",Age = 23,Pet = "" },
    //new { FirstName = "Hector",LastName = "Yates",Age = 23,Pet = "" },
    //new { FirstName = "Delilah",LastName = "Hensley",Age = 19,Pet = "goat" },
    //new { FirstName = "Richard",LastName = "Le",Age = 25,Pet = "frog,rabbit" },
    //new { FirstName = "Genevieve",LastName = "Stevens",Age = 18,Pet = "spider,snake" },
    //new { FirstName = "Inez",LastName = "Dennis",Age = 27,Pet = "fish,frog,bird" },
    //new { FirstName = "Steel",LastName = "Ewing",Age = 23,Pet = "mouse" },
    //new { FirstName = "Tana",LastName = "Shelton",Age = 21,Pet = "snake,cat,mouse" },
    //new { FirstName = "Jared",LastName = "Snow",Age = 27,Pet = "dog,cat" },
    //new { FirstName = "Chanda",LastName = "Berry",Age = 19,Pet = "turtle" },
    //new { FirstName = "Conan",LastName = "Little",Age = 18,Pet = "snake,spider" },
    //new { FirstName = "Michelle",LastName = "Bass",Age = 27,Pet = "fish,frog" },
    //new { FirstName = "Keaton",LastName = "Houston",Age = 27,Pet = "dog,spider" },
    //new { FirstName = "Shelly",LastName = "Vaughn",Age = 31,Pet = "" },
    //new { FirstName = "Felix",LastName = "Cantrell",Age = 19,Pet = "mouse,turtle" },
    //new { FirstName = "Ralph",LastName = "Swanson",Age = 22,Pet = "frog" },
    //new { FirstName = "Cadman",LastName = "Cobb",Age = 22,Pet = "" },
    //new { FirstName = "Daniel",LastName = "Potts",Age = 23,Pet = "cat" },
    //new { FirstName = "Simone",LastName = "Sloan",Age = 30,Pet = "" },
    //new { FirstName = "Rylee",LastName = "Mckinney",Age = 28,Pet = "snake,bird,rabbit" },
    //new { FirstName = "Caryn",LastName = "Bates",Age = 30,Pet = "goat" },
    //new { FirstName = "Sydney",LastName = "Flores",Age = 26,Pet = "turtle,frog" },
    //new { FirstName = "Daryl",LastName = "Morin",Age = 32,Pet = "snake,goat" },
    //new { FirstName = "Tiger",LastName = "Melendez",Age = 21,Pet = "goat" },
    //new { FirstName = "Tiger",LastName = "Dalton",Age = 30,Pet = "" },
    //new { FirstName = "Caldwell",LastName = "Battle",Age = 24,Pet = "" },
    //new { FirstName = "Cally",LastName = "Whitaker",Age = 29,Pet = "dog,rabbit" },
    //new { FirstName = "Gavin",LastName = "Roy",Age = 27,Pet = "snake,cat,frog" },
    //new { FirstName = "Chester",LastName = "Donaldson",Age = 23,Pet = "spider,frog" },
    //new { FirstName = "Lyle",LastName = "Weiss",Age = 32,Pet = "" },
    //new { FirstName = "Inga",LastName = "Herring",Age = 20,Pet = "mouse,spider,snake" },
    //new { FirstName = "Owen",LastName = "Harrison",Age = 29,Pet = "snake,turtle" },
    //new { FirstName = "Ulla",LastName = "Ford",Age = 19,Pet = "fish,frog" },
    //new { FirstName = "Allen",LastName = "Joyner",Age = 31,Pet = "dog,spider" },
    //new { FirstName = "Owen",LastName = "Bullock",Age = 24,Pet = "dog" },
    //new { FirstName = "Bernard",LastName = "Dyer",Age = 26,Pet = "mouse,dog,turtle" },
    //new { FirstName = "Serena",LastName = "Burns",Age = 18,Pet = "" },
    //new { FirstName = "Bernard",LastName = "Frank",Age = 30,Pet = "turtle,frog,rabbit" },
    //new { FirstName = "Lacy",LastName = "Watson",Age = 30,Pet = "turtle,cat,dog" },
    //new { FirstName = "Medge",LastName = "Mooney",Age = 19,Pet = "bird" },
    //new { FirstName = "Piper",LastName = "Lewis",Age = 31,Pet = "cat,dog" },
    //new { FirstName = "Mark",LastName = "Merrill",Age = 18,Pet = "turtle,frog" },
    //new { FirstName = "Amber",LastName = "Livingston",Age = 23,Pet = "" },
    //new { FirstName = "Nadine",LastName = "Boyer",Age = 25,Pet = "turtle,fish" },
    //new { FirstName = "Felicia",LastName = "Olsen",Age = 28,Pet = "mouse,bird" },
    //new { FirstName = "Cassady",LastName = "Shepard",Age = 23,Pet = "turtle" },
    //new { FirstName = "Paloma",LastName = "Simpson",Age = 23,Pet = "" },
    //new { FirstName = "Bell",LastName = "Peters",Age = 22,Pet = "spider" },
    //new { FirstName = "Faith",LastName = "Thomas",Age = 27,Pet = "rabbit" },
    //new { FirstName = "Xaviera",LastName = "Moore",Age = 31,Pet = "" },
    //new { FirstName = "Gay",LastName = "West",Age = 26,Pet = "" },
    //new { FirstName = "Upton",LastName = "Small",Age = 27,Pet = "" },
    //new { FirstName = "Pascale",LastName = "Ruiz",Age = 30,Pet = "cat" },
    //new { FirstName = "Calista",LastName = "Harrington",Age = 26,Pet = "bird,turtle" },
    //new { FirstName = "Illiana",LastName = "Deleon",Age = 30,Pet = "cat,frog,spider" },
    //new { FirstName = "Phelan",LastName = "Frank",Age = 19,Pet = "" },
    //new { FirstName = "Prescott",LastName = "Glass",Age = 20,Pet = "snake" },
    //new { FirstName = "Jerome",LastName = "Vasquez",Age = 29,Pet = "" },
    //new { FirstName = "Trevor",LastName = "Hess",Age = 30,Pet = "cat" },
    //new { FirstName = "Amity",LastName = "Mcclure",Age = 21,Pet = "mouse,goat" },
    //new { FirstName = "Merrill",LastName = "Guthrie",Age = 21,Pet = "goat,turtle,cat" },
    //new { FirstName = "Malachi",LastName = "Boyer",Age = 30,Pet = "frog,snake,bird" },
    //new { FirstName = "Jared",LastName = "Johns",Age = 29,Pet = "frog,bird,spider" },
    //new { FirstName = "Lilah",LastName = "Mejia",Age = 28,Pet = "rabbit" },
    //new { FirstName = "Roary",LastName = "Duran",Age = 31,Pet = "snake,cat" },
    //new { FirstName = "Alexandra",LastName = "Holland",Age = 30,Pet = "goat" },
    //new { FirstName = "Cade",LastName = "Taylor",Age = 29,Pet = "dog,bird,goat" },
    //new { FirstName = "Martin",LastName = "Price",Age = 30,Pet = "turtle" },
    //new { FirstName = "Dane",LastName = "Hernandez",Age = 22,Pet = "" },
    //new { FirstName = "Dominic",LastName = "Stanton",Age = 23,Pet = "" },
    //new { FirstName = "Veda",LastName = "Frank",Age = 31,Pet = "rabbit" },
    //new { FirstName = "Elton",LastName = "Roberts",Age = 21,Pet = "mouse,goat,rabbit" },
    //new { FirstName = "Hamish",LastName = "Tillman",Age = 22,Pet = "cat,rabbit,goat" },
    //new { FirstName = "Knox",LastName = "Waters",Age = 22,Pet = "bird,frog,cat" },
    //new { FirstName = "Gisela",LastName = "Gardner",Age = 31,Pet = "dog,turtle,cat" },
    //new { FirstName = "Ferdinand",LastName = "Quinn",Age = 25,Pet = "" },
    //new { FirstName = "Zorita",LastName = "Wiley",Age = 22,Pet = "frog" },
    //new { FirstName = "Marny",LastName = "Wilder",Age = 23,Pet = "rabbit,bird" },
    //new { FirstName = "Adrian",LastName = "Benton",Age = 23,Pet = "frog" },
    //new { FirstName = "Joelle",LastName = "Hines",Age = 21,Pet = "turtle" },
    //new { FirstName = "Griffin",LastName = "Bowman",Age = 19,Pet = "" },
    //new { FirstName = "Kay",LastName = "Donovan",Age = 19,Pet = "goat" },
    //new { FirstName = "Nissim",LastName = "Molina",Age = 30,Pet = "" },
    //new { FirstName = "Erin",LastName = "Vang",Age = 31,Pet = "cat" },
    //new { FirstName = "Fuller",LastName = "Parker",Age = 32,Pet = "fish,spider" },
    new { FirstName = "Amaya",LastName = "Reese",Age = 31,Pet = "dog,mouse,spider" },
    new { FirstName = "Holly",LastName = "Hernandez",Age = 21,Pet = "" },
    new { FirstName = "Iona",LastName = "Adkins",Age = 29,Pet = "" },
    new { FirstName = "William",LastName = "Gonzalez",Age = 24,Pet = "fish,goat,dog" },
    new { FirstName = "Stephanie",LastName = "Brooks",Age = 20,Pet = "goat,mouse,spider" },
    new { FirstName = "Kieran",LastName = "Rush",Age = 31,Pet = "cat,fish,turtle" },
    new { FirstName = "Seth",LastName = "Crawford",Age = 31,Pet = "spider,cat,frog" },
    new { FirstName = "Anne",LastName = "Munoz",Age = 28,Pet = "dog,cat" },
    new { FirstName = "Yardley",LastName = "Pugh",Age = 21,Pet = "dog" }
};
           int id = 1;
            Persons = data.Select(x =>
                {
                    return new Person()
                    {
                        Id = id++,
                        FirstName = x.FirstName,
                        LastName = x.LastName,
                        Age = x.Age,
                        Pets = x.Pet.Split(",", StringSplitOptions.RemoveEmptyEntries).ToList()
                    };
                })
            .ToList();


        }
    }
}
