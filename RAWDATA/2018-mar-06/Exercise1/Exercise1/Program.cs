using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;

namespace Exercise1
{
    class Program
    {
        static void Main(string[] args)
        {
            //List<Post> PostList = ReadCSV("d:/Dokumentumok.Zoli/iskola/_RUC/RUC_S18/RAWDATA/2018-mar-06/data.csv");
            List<Post> PostList = ReadCSV(@"../../../../../data.csv");

            // Exercise a)
            Console.WriteLine("Exercise A:");
            string LongestTitle = GetLongestTitle(PostList);
            Console.WriteLine(LongestTitle);
            Console.WriteLine("-----------");

            // Exercise b)
            Console.WriteLine("Exercise B:");
            foreach (var CurrentPost in PostList)
            {
                Console.WriteLine($"{CurrentPost.Id} | {CurrentPost.TitleLength}");
            }
            Console.WriteLine("-----------");


            // Exercise c)
            StringBuilder csv = new StringBuilder();

            for (int i = 0; i < PostList.Count; i++)
            {
                for (int j = 0; j < PostList[i].WordsInTitle.Count; j++)
                {
                    String newline = string.Format($"{PostList[i].Id},\"{PostList[i].WordsInTitle[j]}\"");
                    csv.AppendLine(newline);
                }
            }
            File.WriteAllText(@"../../../../../exercise1_C.csv", csv.ToString());
            


            Console.ReadKey();
        }

        static string GetLongestTitle(List<Post> PostList)
        {
            string LongestTitle = "";
            for (int i = 0; i < PostList.Count; i++)
            {
                if ( PostList[i].TitleLength > LongestTitle.Length )
                {
                    LongestTitle = PostList[i].Title;
                }
            }

            return LongestTitle;
        }


        static List<Post> ReadCSV(string Path)
        {
            using (var reader = new StreamReader(Path))
            {
                List<Post> PostList = new List<Post>();

                while (!reader.EndOfStream)
                {

                    var line = reader.ReadLine();
                    var values = line.Split(',');

                    //Trim "" characters from start and end
                    values[1] = values[1].Remove(0, 1);
                    values[1] = values[1].Remove(values[1].Length - 1, 1);

                    Post post = new Post(values[0], values[1]);
                    PostList.Add(post);
                }

                return PostList;
            }
        }

        class Post
        {
            private int _Id;
            private string _Title;

            private int _TitleLength;
            private List<string> _WordsInTitle;

            public Post(string id, string title)
            {
                this._Id = int.Parse(id);
                this._Title = title;
                this._TitleLength = title.Length;
                _WordsInTitle = new List<string>();

                CollectWordsFromTitle();
            }

            public int Id
            {
                get => this._Id;
            }
            public string Title
            {
                get => this._Title;
            }
            public int TitleLength
            {
                get => this._TitleLength;
            }
            public List<String> WordsInTitle
            {
                get => this._WordsInTitle;
            }

            private void CollectWordsFromTitle()
            {
                string pattern = @"\w+";
                foreach (Match m in Regex.Matches(_Title, pattern))
                {
                    _WordsInTitle.Add(m.Value.ToLower());
                }

                for (int i = 0; i < _WordsInTitle.Count; i++)
                {
                    for (int j = i+1; j < _WordsInTitle.Count; j++)
                    {
                        if (_WordsInTitle[i].Equals(_WordsInTitle[j], StringComparison.OrdinalIgnoreCase))
                        {
                            _WordsInTitle.RemoveAt(j);
                        }
                    }
                }
            }



        }
    }
}
