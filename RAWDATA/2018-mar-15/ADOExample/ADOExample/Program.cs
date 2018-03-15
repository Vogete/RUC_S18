using MySql.Data.MySqlClient;
using System;

namespace ADOExample
{
    class Program
    {
        static void Main(string[] args)
        {
            string server = "178.62.226.178";
            string dbname = "northwind";
            string username = "nwuser";
            string password = "nwuser";

            string connStr = $"server={server};database={dbname};uid={username};pwd={password}";

            using (var conn = new MySqlConnection(connStr))
            {
                conn.Open();
                Console.WriteLine("Connected to " + conn.DataSource);

                using (var cmd = new MySqlCommand("select * from categories", conn))
                {
                    //cmd.Connection = conn;
                    //cmd.CommandText = "select * from categories";

                    MySqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        //Console.WriteLine(reader.GetString(1));

                        string result = (string)reader["CategoryName"];
                        Console.WriteLine(result);

                    }

                }
            }


            Console.ReadKey();
        }
    }
}
