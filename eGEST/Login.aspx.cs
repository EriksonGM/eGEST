using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebMatrix.WebData;

namespace eGEST
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (WebMatrix.WebData.WebSecurity.UserExists(txtUsuario.Text))
                {
                    if (WebSecurity.Login(txtUsuario.Text, txtPass.Text))
                    {
                        var returnUrl = Request.QueryString["ReturnUrl"];

                      //  LoginUsuario();

                        if (string.IsNullOrEmpty(returnUrl))
                        {

                            Response.Redirect("/Inicio.aspx");
                        }
                        else
                        {
                            Response.Redirect(returnUrl);
                        }
                    }
                    else
                    {
                        lblMsg.Visible = true;
                    }
                }
                else
                {
                    lblMsg.Visible = true;
                }
            }
        }

        public void LoginUsuario()
        {
            using (SqlConnection SQLconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString()))
            {
                SqlCommand cmd = new SqlCommand("LoginUsuario", SQLconn);

                cmd.Parameters.AddWithValue("@Id_Usuario", WebSecurity.CurrentUserId.ToString());

                cmd.CommandType = CommandType.StoredProcedure;

                SQLconn.Open();

                cmd.ExecuteNonQuery();

                SQLconn.Close();

            }
        }


    }
}