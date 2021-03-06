﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class UserRegistrationEntities
    {
        public int ID { get; set; }
        public int ExamId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }

        public bool IsAuthenticated { get; set; }

        public int RoleId { get; set; }
    }
}
