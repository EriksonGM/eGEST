using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using WebMatrix.WebData;

namespace eGEST
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            WebSecurity.InitializeDatabaseConnection("Conn", "Tb_Usuario", "Id_Usuario", "Usuario", true);

            if (!Roles.RoleExists("Estudante"))
            {
                Roles.CreateRole("Estudante");
            }

            if (!Roles.RoleExists("Professor"))
            {
                Roles.CreateRole("Professor");
            }

            if (!Roles.RoleExists("SecEstudantes"))
            {
                Roles.CreateRole("SecEstudantes");
            }

            if (!Roles.RoleExists("SecProfessores"))
            {
                Roles.CreateRole("SecProfessores");
            }

            if (!Roles.RoleExists("DirAcademica"))
            {
                Roles.CreateRole("DirAcademica");
            }

            if (!Roles.RoleExists("Admin"))
            {
                Roles.CreateRole("Admin");
            }

            if (!WebSecurity.UserExists("admin"))
            {
                WebSecurity.CreateUserAndAccount("admin", "qwerty123#", new
                {
                    Nome = "Admin"
                });

                Roles.AddUserToRole("admin", "Admin");
            }
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}