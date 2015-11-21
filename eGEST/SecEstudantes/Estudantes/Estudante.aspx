<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="Estudante.aspx.cs" Inherits="eGEST.SecEstudantes.Estudantes.Estudante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <style>
        .form-control {
            border-color: transparent;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitle" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" runat="server">
    <div>
        <div class="col-md-8">
            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">Perfil de Estudante</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Minimizar"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Fechar"><i class="fa fa-times"></i></button>
                    </div>
                </div>
                <div class="box-body">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id_Estudante" DataSourceID="SqlDataSourceEstudante" Width="100%">
                        <ItemTemplate>
                            <div class="form-horizontal row-border">

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Codigo:</label>
                                    <div class="col-md-9">
                                        <asp:Label Text='<%# Eval("Id_Estudante") %>' runat="server" ID="Label1" CssClass="form-control" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Nº de Matricula:</label>
                                    <div class="col-md-9">
                                        <asp:Label Text='<%# Eval("NumMatricula") %>' runat="server" ID="NumMatriculaLabel" CssClass="form-control" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Nome:</label>
                                    <div class="col-md-9">
                                        <asp:Label Text='<%# Eval("Nome") %>' runat="server" ID="NomeLabel" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Nome do Pai:</label>
                                    <div class="col-md-9">
                                        <asp:Label Text='<%# Eval("NomePai") %>' runat="server" ID="NomePaiLabel" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Nome da Mãe:</label>
                                    <div class="col-md-9">
                                        <asp:Label Text='<%# Eval("NomeMae") %>' runat="server" ID="NomeMaeLabel" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label"><%# Eval("TipoDoc") %>:</label>
                                    <div class="col-md-9">
                                        <asp:Label Text='<%# Eval("NumDoc") %>' runat="server" ID="NumDocLabel" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Data de Nascimento</label>
                                    <div class="col-md-9">
                                        <asp:Label Text='<%# Eval("DataNasc") %>' runat="server" ID="Label5" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Genero</label>
                                    <div class="col-md-9">
                                        <asp:Label Text='<%# Eval("Genero") %>' runat="server" ID="Label4" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Contacto Telefonico</label>
                                    <div class="col-md-9">
                                        <asp:Label Text='<%# Eval("Telf") %>' runat="server" ID="Label3" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Email</label>
                                    <div class="col-md-9">
                                        <asp:Label Text='<%# Eval("Email") %>' runat="server" ID="Label2" />
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceEstudante" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Estudante.Id_Estudante, Tb_Usuario.Nome, Tb_Estudante.NomePai, Tb_Estudante.NomeMae, Tb_Estudante.NumMatricula, Tb_TipoDoc.TipoDoc, Tb_Estudante.NumDoc, Tb_Estudante.Especial, Tb_Estudante.DataNasc, Tb_Genero.Genero, Tb_Estudante.Telf, Tb_Estudante.Email FROM Tb_Estudante INNER JOIN Tb_Genero ON Tb_Estudante.Id_Genero = Tb_Genero.Id_Genero INNER JOIN Tb_Usuario ON Tb_Estudante.Id_Usuario = Tb_Usuario.Id_Usuario INNER JOIN Tb_TipoDoc ON Tb_Estudante.Id_TipoDoc = Tb_TipoDoc.Id_TipoDoc WHERE (Tb_Estudante.Id_Estudante = @Id_Estudante)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="Id" Name="Id_Estudante"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
       <%-- </div>
        <div class="col-md-4">--%>
            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">Historial</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Minimizar"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Fechar"><i class="fa fa-times"></i></button>
                    </div>
                </div>
                <div class="box-body">
                    <asp:ListView ID="lvHistorial" runat="server" DataSourceID="SqlDataSourceHistorial">
                        
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>Sem Resultados.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                       
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label Text='<%# Eval("AnoLectivo") %>' runat="server" ID="AnoLectivoLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("Turma") %>' runat="server" ID="TurmaLabel" /></td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server" style="width:100%">
                                <tr runat="server">
                                    <td runat="server">
                                        <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                            <tr runat="server" style="">
                                                <th runat="server">Ano Lectivo</th>
                                                <th runat="server">Turma</th>
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
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceHistorial" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Turma.AnoLectivo, Tb_Turma.Turma FROM Tb_EstudanteTurma INNER JOIN Tb_Turma ON Tb_EstudanteTurma.Id_Turma = Tb_Turma.Id_Turma WHERE (Tb_EstudanteTurma.Id_Estudante = @Id_Estudante)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="Id" Name="Id_Estudante"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <!-- /.box-body -->

            </div>
            <!-- /.box -->
        </div>
    </div>

</asp:Content>
