using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySchool.Entities;
using MySchool.DAL;

namespace MySchool.BL
{
    public class UserRegistrationBL
    {
        public int SaveUser(UserRegistrationEntities userRegistrationEntities)
        {
            UserRegistrationDAL userRegistrationDAL = new UserRegistrationDAL();
            return userRegistrationDAL.SaveUser(userRegistrationEntities);
        }

    }
}
