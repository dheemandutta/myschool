using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySchool.Entities;
using MySchool.DAL;

namespace MySchool.BL
{
    public class YearBL
    {
        public int SaveYear(YearEntities yearEntities)
        {
            YearDAL yearDAL = new YearDAL();
            return yearDAL.SaveYear(yearEntities);
        }

        public List<YearEntities> GetYearPageWise(int pageIndex, ref int recordCount, int length)
        {
            YearDAL yearDAL = new YearDAL();
            return yearDAL.GetYearPageWise(pageIndex, ref recordCount, length);
        }
    }
}
