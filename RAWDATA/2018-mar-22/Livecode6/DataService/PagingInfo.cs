using System;
using System.Collections.Generic;
using System.Text;

namespace DataService
{
    public class PagingInfo
    {
        const int MaxPageSize = 50;
        private int _pageSize;

        public int Page { get; set; }
        public int PageSize
        {
            get
            {
                return _pageSize;
            }
            set
            {
                if (value > MaxPageSize)
                {
                    _pageSize = MaxPageSize;
                }
                _pageSize = value;
            }
        }
    }
}
