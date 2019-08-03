using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class DonationEntities
    {
        public int ID { get; set; }

        public int CampaignID { get; set; }

        public decimal DonetionAmt { get; set; }

        public DateTime Date { get; set; }

        public decimal? RefundAmt { get; set; }
    }
}
