<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="Turma.aspx.cs" Inherits="eGEST.SecEstudantes.Turmas.Turma" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitle" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" runat="server">
    <div class="nav-tabs-custom">
        <ul class="nav nav-tabs pull-right">
            <li><a href="#professores" data-toggle="tab">Professores</a></li>
            <li><a href="#estudantes" data-toggle="tab">Estudantes</a></li>
            <li class="active"><a href="#info" data-toggle="tab">Informação</a></li>
            <%--<li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Opções<span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
                    <li role="presentation" class="divider"></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
                </ul>
            </li>--%>
            <li class="pull-left header"><i class="fa fa-users"></i>
                <b>Turma: </b>
                <asp:Label ID="lmlTurma" runat="server" Text=""></asp:Label>

            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="info">
            </div>
            <!-- /.tab-pane -->
            <div class="tab-pane" id="estudantes">
                <asp:ListView ID="lvEstudantes" runat="server" DataSourceID="SqlDataSourceEstudantes" DataKeyNames="Id_Estudante">

                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>Nenhum estudante nesta turma.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>

                    <ItemTemplate>
                        <tr style="">
                            <td>
                                <a class="btn btn-primary btn-xs" href='<%# "/SecEstudantes/Estudantes/Estudante.aspx?Id=" + Eval("Id_Estudante") %>'><i class="fa fa-info-circle"></i></a>
                            </td>
                            <td>
                                <asp:Label Text='<%# Eval("NumMatricula") %>' runat="server" ID="NumMatriculaLabel" /></td>
                            <td>
                                <asp:Label Text='<%# Eval("Nome") %>' runat="server" ID="NomeLabel" /></td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server" style="width: 100%">
                            <tr runat="server">
                                <td runat="server">
                                    <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                        <tr runat="server" style="">
                                            <th runat="server" style="width: 20px;"></th>
                                            <th runat="server" style="width: 100px">Nº</th>
                                            <th runat="server">Nome</th>
                                        </tr>
                                        <tr runat="server" id="itemPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style=""></td>
                            </tr>
                        </table>
                    </LayoutTemplate>

                </asp:ListView>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceEstudantes" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Estudante.Id_Estudante, Tb_Estudante.NumMatricula, Tb_Usuario.Nome FROM Tb_EstudanteTurma INNER JOIN Tb_Estudante ON Tb_EstudanteTurma.Id_Estudante = Tb_Estudante.Id_Estudante INNER JOIN Tb_Usuario ON Tb_Estudante.Id_Usuario = Tb_Usuario.Id_Usuario WHERE (Tb_EstudanteTurma.Id_Turma = @Id_Turma) ORDER BY Tb_Usuario.Nome">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="Id" Name="Id_Turma"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <!-- /.tab-pane -->
            <div class="tab-pane" id="professores">
            </div>
            <!-- /.tab-pane -->
        </div>
        <!-- /.tab-content -->
    </div>
    <!-- nav-tabs-custom -->
</asp:Content>
