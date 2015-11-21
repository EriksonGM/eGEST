using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebMatrix.WebData;

namespace eGEST.SecEstudantes.Estudantes
{
    public partial class CadastrarEstudante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int AnoActual = DateTime.Now.Year;
            SqlDataSourceTurma.SelectParameters["AnoLectivo"].DefaultValue = AnoActual.ToString();
            SqlDataSourceTurma.InsertParameters["Id_Usuario"].DefaultValue = WebSecurity.CurrentUserId.ToString();
            SqlDataSourceAno.SelectParameters["AnoLectivo"].DefaultValue = AnoActual.ToString();
            SqlDataSourceCurso.SelectParameters["AnoLectivo"].DefaultValue = AnoActual.ToString();
            
        }

        protected void CadastarEstudante()
        {
            if (!WebSecurity.UserExists(txtNumMatricula.Text))
            {
                try
                {
                    WebSecurity.CreateUserAndAccount(txtNumMatricula.Text, txtNumDoc.Text, new
                    {
                        Nome = txtNome.Text
                    });

                    Roles.AddUserToRole(txtNumMatricula.Text, "Estudante");

                    SqlDataSourceTurma.Insert();

                    Util.Notificar();

                    Response.Redirect("/SecEstudantes/Turmas/Turma.aspx?Id=" + ddlTurma.SelectedValue);

                }
                catch (Exception)
                {
                    //Util.Alertar("Aconteceu um error, confira os dados e tente novamente.");
                    throw;
                }
            }
        }

        protected void SqlDataSourceTurma_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            DataTable dt = new DataTable();

            using (SqlConnection SQLconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString()))
            {

                SqlCommand cmd = new SqlCommand("Select Id_Disciplina from Tb_Disciplina Where Id_Curso = " + ddlCurso.SelectedValue, SQLconn);

                cmd.CommandType = CommandType.Text;

                SQLconn.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                da.Fill(dt);

                SQLconn.Close();

            }

            if (dt.Rows.Count != 0)
            {

                foreach (DataRow dr in dt.Rows)
                {
                    SqlDataSourceCurso.InsertParameters["Id_Disciplina"].DefaultValue = dr[0].ToString();
                    SqlDataSourceCurso.Insert();
                }

            }
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlDataSourceCurso.InsertParameters["NumMatricula"].DefaultValue = txtNumMatricula.Text;
                CadastarEstudante();
            }
        }
    }
}