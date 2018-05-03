using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Exercise4_2.DomainModel;

namespace Exercise4_2.DataAccessLayer
{
    public interface IDataService
    {
        List<Post> GetPosts(int page, int pageSize);
        Post GetPost(int id);
        List<Post> GetAnswers(int id);
        int NumberOfQuestions();
    }
}
