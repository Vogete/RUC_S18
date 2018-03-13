using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace Exercise2
{
    class Program
    {
        static void Main(string[] args)
        {

            

            Console.ReadKey();
        }

        static public decimal RPCalculate(String expression)
        {
            decimal result = 0;
            List<Token> stack = new List<Token>();
            List<Token> tokens = SplitOperation(expression);

            foreach (var token in tokens)
            {

            }


            return result;
        }

        static public List<Token> SplitOperation(string expression)
        {
            List<Token> tokens = new List<Token>();

            if (expression.Length == 0)
            {
                Token nullToken = new Token();
                tokens.Add(nullToken);
                return tokens;
            }

            string[] tokenstrings = expression.Split(" ");

            for (int i = 0; i < tokenstrings.Length; i++)
            {
                Token _newToken = new Token(tokenstrings[i]);
                tokens.Add(_newToken);
            }
            

            return tokens;

        }

        public class Token
        {
            private string token;
            private bool isDigit;

            public Token(String _token = "")
            {
                this.token = _token;
                this.isDigit = IsNumber(_token);
            }

            private bool IsNumber(string _token)
            {                
                bool isNumeric = int.TryParse(_token, out int n);
                return isNumeric;
            }

            public string GetToken
            {
                get => this.token;
            }

            public bool IsDigit
            {
                get => this.isDigit;
            }

        }

    }
}
