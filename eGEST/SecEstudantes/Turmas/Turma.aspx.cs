using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eGEST.SecEstudantes.Turmas
{
    public partial class Turma : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var Id = Request.QueryString["Id"];

            if (!string.IsNullOrEmpty(Id))
            {
                using (SqlConnection SQLconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString()))
                {
                    SqlCommand cmd = new SqlCommand("Select Turma from Tb_Turma Where Id_Turma=" + Id, SQLconn);

                    cmd.CommandType = CommandType.Text;

                    SQLconn.Open();

                    lmlTurma.Text = cmd.ExecuteScalar().ToString();

                    SQLconn.Close();
                }
            }
        }
    }
}