<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="CrearTurma.aspx.cs" Inherits="eGEST.DirAcademica.CrearTurma" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <style>
        .iradio_flat-blue {
            margin-left: 15px;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitle" runat="server">
    Criar Turma
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" runat="server">
    <!-- Default box -->
    <div class="row">
        <div class="col-md-8 col-sm-10">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">Nova Turma</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Minimizar"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Fechar"><i class="fa fa-times"></i></button>
                    </div>
                </div>
                <div class="box-body ">
                    <div class="form-horizontal row-border">
                        <div class="form-group">
                            <label class="col-md-3 control-label">Curso</label>
                            <div class="col-md-9">
                                <asp:DropDownList ID="ddlCurso" CssClass="form-control" runat="server" DataSourceID="SqlDataSourceCurso" DataTextField="Curso" DataValueField="Id_Curso"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSourceCurso" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT * FROM [Tb_Curso]" InsertCommand="AddTurma" InsertCommandType="StoredProcedure">
                                    <InsertParameters>
                                        <asp:Parameter Name="Id_Usuario" Type="Int32"></asp:Parameter>
                                        <asp:ControlParameter ControlID="rblPeriodo" Name="Id_Periodo" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlAno" Name="Id_Ano" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlCurso" Name="Id_Curso" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="txtTurma" Name="Turma" PropertyName="Text" Type="String" />
                                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlAnoLectivo" Name="AnoLectivo" PropertyName="SelectedValue" Type="Int32" />
                                    </InsertParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">Ano</label>
                            <div class="col-md-9">
                                <asp:DropDownList ID="ddlAno" CssClass="form-control" runat="server" DataSourceID="SqlDataSourceAno" DataTextField="Ano" DataValueField="Id_Ano"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSourceAno" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT * FROM [Tb_Ano]"></asp:SqlDataSource>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">Periodo</label>
                            <div class="col-md-9">
                                <asp:RadioButtonList ID="rblPeriodo" runat="server" CssClass="icheck form-control" DataSourceID="SqlDataSourcePeriodo" DataTextField="Periodo" DataValueField="Id_Periodo" RepeatLayout="Table" RepeatDirection="Horizontal"></asp:RadioButtonList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSourcePeriodo" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT [Id_Periodo], [Periodo] FROM [Tb_Periodo]"></asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Falta seleccionar o Periodo." ControlToValidate="rblPeriodo" Display="Dynamic" ForeColor="Red"><p style="margin-top:5px"><i class="fa fa-asterisk"></i>&nbsp;Falta seleccionar o Periodo.</p></asp:RequiredFieldValidator>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">Ano Lectivo</label>
                            <div class="col-md-9">
                                <asp:DropDownList ID="ddlAnoLectivo" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Sala</label>
                            <div class="col-md-9">
                                <asp:DropDownList ID="ddlSala" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceSala" DataTextField="Sala" DataValueField="Id_Sala"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSourceSala" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT * FROM [Tb_Sala]"></asp:SqlDataSource>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">Nome da Turma</label>
                            <div class="col-md-9">
                                <asp:TextBox ID="txtTurma" runat="server" MaxLength="10" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta o nome da turma." ControlToValidate="txtTurma" Display="Dynamic" ForeColor="Red"><p style="margin-top:5px"><i class="fa fa-asterisk"></i>&nbsp;Falta o nome da turma.</p></asp:RequiredFieldValidator>
 
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label"></label>
                            <div class="col-md-9">
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta seleccionar o Periodo." ControlToValidate="rblPeriodo" Display="Dynamic" ForeColor="Red"><i class="fa fa-asterisk"></i>&nbsp;Falta seleccionar o Periodo.</asp:RequiredFieldValidator>--%>
                            </div>
                        </div>
                    </div>


                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <asp:LinkButton ID="btnOk" runat="server" CssClass="btn btn-success pull-right" OnClick="btnOk_Click"><i class="fa fa-plus"></i>&nbsp; Criar Turma</asp:LinkButton>
                </div>
                <!-- /.box-footer-->
            </div>
            <!-- /.box -->
        </div>
    </div>
</asp:Content>
