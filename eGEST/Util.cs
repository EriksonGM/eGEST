using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace eGEST
{
    public class Util
    {
        public static void Alertar(string mensagem)
        {
            HttpContext.Current.Session["Alerta"] = mensagem;
        }

        public static void Notificar()
        {
            HttpContext.Current.Session["Notice"] = "Notificar";
        }

        public static void EnviarEmail(string assunto, string mensagem, string destinatario)
        {
            var smtp = new SmtpClient("smtp.live.com", 587);
            smtp.EnableSsl = true;
            var msg = new MailMessage("admin@softmark.com.br", destinatario, assunto, mensagem);
            msg.IsBodyHtml = true;
            var cred = new NetworkCredential("admin@softmark.com.br", "softmark");
            smtp.Credentials = cred;
            smtp.Send(msg);
        }

        public static string GerarSenhaAleatoria(int tamanho)
        {
            string caracteresPermitidos = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789!@$?_-*&#+";
            char[] senhaGerada = new char[tamanho];
            Random rd = new Random();
            for (int i = 0; i < tamanho; i++)
            {
                senhaGerada[i] = caracteresPermitidos[rd.Next(0, caracteresPermitidos.Length)];
            }
            return new string(senhaGerada);
        }

        public string Mayuscula(string strWord)
        {
            try
            {
                string[] arrWords = strWord.Split(' ');
                string strTemp2 = string.Empty;

                if (arrWords.Length > 1) //Existe mas de una palabra, Ej ANA MARIA
                {
                    foreach (string strTemp in arrWords)
                    {
                        strTemp2 += strTemp.Substring(0, 1).ToUpper() + strTemp.Substring(1).ToLower() + " ";
                    }
                }
                else
                    strTemp2 = arrWords[0].Substring(0, 1).ToUpper() + arrWords[0].Substring(1).ToLower() + " ";

                return strTemp2.Substring(0, strTemp2.Length - 1);
            }
            catch (Exception ex)
            {
                string strError = ex.Message;
                return strWord;
            }

        }


    }


    public class News
    {

        public struct TipoNew
        {
            public const int Notificacao = 1;
            public const int Informacao = 2;
            public const int Alerta = 3;
            public const int Perigo = 4;
        }

        public static bool SendNew(int Id_Usuario, int Tipo, string Head, string Body)
        {
            try
            {
                using (SqlConnection SQLconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString()))
                {
                    SqlCommand cmd = new SqlCommand("AddNew", SQLconn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Id_Usuario", SqlDbType.Int);
                    cmd.Parameters["@Id_Usuario"].Value = Id_Usuario;
                    cmd.Parameters.AddWithValue("@Id_NewIcon", Tipo);
                    cmd.Parameters.AddWithValue("@Head", Head);
                    cmd.Parameters.AddWithValue("@Body", Body);
                    SQLconn.Open();
                    cmd.ExecuteNonQuery();
                    SQLconn.Close();
                    SQLconn.Dispose();
                }

                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public static string Tiempo(DateTime T)
        {

            TimeSpan Ts = DateTime.Now - T;

            if (Ts.Days > 30)
            {
                return "a mais de um mês";
            }
            else if (Ts.Days > 1)
            {
                return "a " + Ts.Days.ToString() + " dias.";
            }

            else if (Ts.Days == 1)
            {
                return  "a um dia.";
            }

            else if (Ts.Hours > 1)
            {
                return "a " + Ts.Hours.ToString() + " horas";
            }

            else if (Ts.Hours == 1)
            {
                return "a uma hora.";
            }

            else if (Ts.Minutes > 1)
            {
                return "a " + Ts.Minutes.ToString() + " minutos.";
            }

            else if (Ts.Minutes == 1)
            {
                return "a um minuto.";
            }
            else
            {
                return "segundos atras.";
            }

        }
    }

}