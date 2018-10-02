using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Http;
using Newtonsoft.Json;



namespace RentingGown
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            GlobalConfiguration.Configuration.Formatters.JsonFormatter.SerializerSettings.Re‌​ferenceLoopHandling = ReferenceLoopHandling.Ignore;
            

            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            Application.Add("CounterVisiters", 0);
            Application.Add("CounterCurrentVisiters", 0);
  
        }
        protected void Session_Start()
        {
            Application["CounterVisiters"] = Convert.ToInt32(Application["CounterVisiters"]) + 1;
            Application["CounterCurrentVisiters"] = Convert.ToInt32(Application["CounterCurrentVisiters"]) + 1;


        }
        protected void Session_End()
        {
            Application["CounterCurrentVisiters"] = Convert.ToInt32(Application["CounterCurrentVisiters"]) - 1;
        }
    }
}
