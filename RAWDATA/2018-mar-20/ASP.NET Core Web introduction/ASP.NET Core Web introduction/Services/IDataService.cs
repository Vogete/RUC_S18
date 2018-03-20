using ASP_NET_Core_Web_Introduction.Domain;
using System.Collections.Generic;

namespace ASP_NET_Core_Web_Introduction.Services
{
    public interface IDataService
    {
        Person GetPerson(int id);
        List<Person> GetPersons();
        void CreatePerson(Person person);
    }
}