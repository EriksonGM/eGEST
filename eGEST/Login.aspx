<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="eGEST.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-pt">
<head runat="server">
    <title>Iniciar Sessão</title>

    <link rel="icon" href="favicon.ico" type="image/x-icon" />

    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="/dist/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="/dist/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="/dist/plugins/iCheck/flat/blue.css" rel="stylesheet" type="text/css" />
</head>
<body class="login-page">
    <form id="form1" runat="server">
        <div class="login-box">
            <div class="login-logo">
                <a><b>e</b>GEST</a>
            </div>
            <!-- /.login-logo -->
            <div class="login-box-body">
                <p class="login-box-msg">Inicio de Sessão</p>

                <div class="form-group has-feedback">
                    <%--<input type="email" class="form-control" placeholder="Email" />--%>
                    
                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" placeholder="Usuario"></asp:TextBox>
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" Display="Dynamic" ControlToValidate="txtUsuario" ForeColor="Red"><i class="fa fa-asterisk"></i>&nbsp; Falta o Nome de Usuario.<br /> </asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" Display="Dynamic" ControlToValidate="txtPass" ForeColor="Red"><i class="fa fa-asterisk"></i>&nbsp; Falta a Senha. <br /></asp:RequiredFieldValidator>
                <a runat="server" visible="false" id="lblMsg" style="color:red"><i class="fa fa-asterisk"></i>&nbsp; Nome o Senha errada.<br /></a>
<%--                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="CustomValidator" OnServerValidate="CustomValidator1_ServerValidate" ForeColor="Red"><i class="fa fa-asterisk"></i>&nbsp; Nome o Senha errada.<br /></asp:CustomValidator>--%>
                <div class="row">
                    <div class="col-xs-8">
                        <%-- <div class="checkbox icheck">
                            <label>
                                <input type="checkbox">
                                Remember Me
                            </label>
                        </div>--%>
                    </div>
                    <!-- /.col -->
                    <div class="col-xs-4">
                        <asp:LinkButton ID="btnEntrar" CssClass="btn btn-primary btn-block btn-flat" runat="server" OnClick="btnEntrar_Click"><i class="fa fa-sign-in"></i>&nbsp;Entrar</asp:LinkButton>
                        <%--<button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>--%>
                    </div>
                    <!-- /.col -->
                </div>


                <%-- <a href="#">I forgot my password</a><br>
            <a href="register.html" class="text-center">Register a new membership</a>--%>
            </div>
            <!-- /.login-box-body -->
        </div>
        <!-- /.login-box -->

        <!-- jQuery 2.1.4 -->
        <script src="/dist/plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <!-- Bootstrap 3.3.4 JS -->
        <script src="/dist/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- iCheck -->
        <script src="/dist/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
        <script>
            $(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_flat-blue',
                    radioClass: 'iradio_flat-blue',
                    increaseArea: '20%' // optional
                });
            });
    </script>

        <div>
        </div>
    </form>
</body>
</html>
