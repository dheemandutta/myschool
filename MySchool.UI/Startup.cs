using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MySchool.UI.Startup))]
namespace MySchool.UI
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
