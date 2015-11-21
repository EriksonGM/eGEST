using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eGEST
{
    public partial class LayOut : System.Web.UI.MasterPage
    {
        public string NomeUsuario;

        protected void Page_Load(object sender, EventArgs e)
        {
            NomeUsuario = Nome();
        }

        public string Nome()
        {
            using (SqlConnection SQLconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString()))
            {
                SqlCommand cmd = new SqlCommand("Select Nome from Tb_Usuario Where Id_Usuario ='" + WebMatrix.WebData.WebSecurity.CurrentUserId.ToString() + "'", SQLconn);

                cmd.CommandType = CommandType.Text;

                SQLconn.Open();

                string N = cmd.ExecuteScalar().ToString();

                SQLconn.Close();

                return N;
            }
        }
    }
}