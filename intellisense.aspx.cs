using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IntellisenseSearchBox
{
    public partial class intellisense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static object search(string charVal)
        {
            List<string> carlist = new List<string>();
            string[] carlsit = { "Bolan ", "BMW", "Suzuki", "Toyota", "Mercedez", "Audi", "Hyundai" };
            string[] link = { "https://suzukipakistan.com/automobile-detail?automobile=4r3y9qgcaavppxfn8xt5dy0ccr", "https://www.bmw.com/en/index.html", "https://suzukipakistan.com/", "https://www.toyota.com/", "https://www.mercedes-benz.com/en/", "https://www.audi.com/en.html", "https://www.hyundai.com/worldwide/en/"};
            for (int count= 0; count < carlsit.Length; count++)
            {
                if (carlsit[count].ToLower().Contains(charVal.ToLower()) && charVal.Length > 0)
                {
                    carlist.Add(carlsit[count]);
                    carlist.Add(link[count]);
                }
            }
            return carlist;
        }
    }
}