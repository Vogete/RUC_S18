using ASP_NET_Core_Web_Introduction.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ASP_NET_Core_Web_Introduction.Services
{
    public class DataService : IDataService
    {
        List<Person> _persons;

        public DataService()
        {
           _persons = new List<Person>
           {
               new Person{ Id = 1, Name = "Joe", Age = 23 },
               new Person{ Id = 2, Name = "Ellen", Age = 26 },
               new Person{ Id = 3, Name = "Sue", Age = 22 },
               new Person{ Id = 4, Name = "John", Age = 27 }
           };

        }

        public List<Person> GetPersons()
        {
            return _persons;
        }

        public Person GetPerson(int id)
        {
            return _persons.FirstOrDefault(x => x.Id == id);
        }


        public void CreatePerson(Person person)
        {
            
            person.Id = _persons.Max(x => x.Id) + 1;
            _persons.Add(person);
        }
    }
}
