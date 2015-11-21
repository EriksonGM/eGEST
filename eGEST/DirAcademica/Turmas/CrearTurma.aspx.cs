using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eGEST.DirAcademica
{
    public partial class CrearTurma : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AnosLectivos();
        }

        protected void AnosLectivos()
        {
            int AnoActual = DateTime.Now.Year;

            for (int i = -4; i < 4; i++)
            {
                ddlAnoLectivo.Items.Add((AnoActual + i).ToString());
            }

            ddlAnoLectivo.SelectedValue = AnoActual.ToString();

        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            SqlDataSourceCurso.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();

            if (Page.IsValid)
            {
                SqlDataSourceCurso.Insert();
                Util.Notificar();
                Response.Redirect(Request.RawUrl);
            }

        }
    }
}