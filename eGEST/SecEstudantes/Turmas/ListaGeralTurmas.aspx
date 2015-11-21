<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="ListaGeralTurmas.aspx.cs" Inherits="eGEST.SecEstudantes.Turmas.ListaGeralTurmas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitle" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" runat="server">
    <!-- Default box -->
    <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title">Turmas Cadastradas</h3>
            <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Minimizar"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Fechar"><i class="fa fa-times"></i></button>
            </div>
        </div>
        <div class="box-body">
           <div class="row">
               <div class="col-md-3">
                   <span>Ano Lectivo</span>
                   <asp:DropDownList ID="ddlAnoLectivo" CssClass="form-control" runat="server" DataSourceID="SqlDataSourceAnoLectivo" DataTextField="AnoLectivo" DataValueField="AnoLectivo" AutoPostBack="True"></asp:DropDownList>
                   <asp:SqlDataSource runat="server" ID="SqlDataSourceAnoLectivo" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT AnoLectivo FROM Tb_Turma GROUP BY AnoLectivo"></asp:SqlDataSource>
               </div>
               <div class="col-md-3">
                   <span>Curso</span>
                   <asp:DropDownList ID="ddlCurso" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceCurso" DataTextField="Curso" DataValueField="Id_Curso" AutoPostBack="True"></asp:DropDownList>
                   <asp:SqlDataSource runat="server" ID="SqlDataSourceCurso" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Curso.Id_Curso, Tb_Curso.Curso FROM Tb_Curso INNER JOIN Tb_Turma ON Tb_Curso.Id_Curso = Tb_Turma.Id_Curso GROUP BY Tb_Curso.Curso, Tb_Curso.Id_Curso"></asp:SqlDataSource>
               </div>
               <div class="col-md-3">
                   <span>Ano</span>
                   <asp:DropDownList ID="ddlAno" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataSourceAno" DataTextField="Ano" DataValueField="Id_Ano"></asp:DropDownList>
                   <asp:SqlDataSource runat="server" ID="SqlDataSourceAno" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Turma.Id_Ano, Tb_Ano.Ano FROM Tb_Ano INNER JOIN Tb_Turma ON Tb_Ano.Id_Ano = Tb_Turma.Id_Ano GROUP BY Tb_Ano.Ano, Tb_Turma.Id_Ano"></asp:SqlDataSource>
               </div>
               <div class="col-md-3">

               </div>
           </div>

            <asp:ListView ID="lvTurmas" runat="server" DataSourceID="SqlDataSourceTurmas" DataKeyNames="Id_Turma">
                
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td><h3>Nenhum resultado disponivel.</h3></td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <a href='<%# "Turma.aspx?Id=" + Eval("Id_Turma").ToString() %>' class="btn btn-primary btn-xs"><i class="fa fa-info-circle"></i></a>                      
                        <td>
                            <asp:Label Text='<%# Eval("Periodo") %>' runat="server" ID="PeriodoLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Ano") %>' runat="server" ID="AnoLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Curso") %>' runat="server" ID="CursoLabel" /></td>
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
                                        <th runat="server" style="width:50px"></th>
                                        <th runat="server">Periodo</th>
                                        <th runat="server">Ano</th>
                                        <th runat="server">Curso</th>
                                        <th runat="server">AnoLectivo</th>
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
            <asp:SqlDataSource runat="server" ID="SqlDataSourceTurmas" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="LoadTurmas" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlAnoLectivo" PropertyName="SelectedValue" Name="AnoLectivo" Type="Int32"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="ddlCurso" PropertyName="SelectedValue" Name="Id_Curso" Type="Int32"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="ddlAno" PropertyName="SelectedValue" Name="Id_Ano" Type="Int32"></asp:ControlParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
                <a class="btn btn-success pull-right" href="/DirAcademica/Turmas/CrearTurma.aspx"><i class="fa fa-plus"></i>&nbsp; Criar Turma</a>
        </div>
        <!-- /.box-footer-->
    </div>
    <!-- /.box -->
</asp:Content>
