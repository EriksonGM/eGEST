<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="CadastrarEstudante.aspx.cs" Inherits="eGEST.SecEstudantes.Estudantes.CadastrarEstudante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <style>
        .icheckbox_flat-blue {
            margin-right: 5px;
        }

        .iradio_flat-blue {
            margin-left: 10px;
            margin-right: 5px;
        }

        input{
            max-width:600px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitle" runat="server">
    Cadastro de Estudante
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" runat="server">
    <!-- Default box -->
    <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title">Informação do Estudante</h3>
            <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Minimizar"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Fechar"><i class="fa fa-times"></i></button>
            </div>
        </div>
        <div class="box-body">
            <div class="form-horizontal row-border">
                <div class="form-group">
                    <label class="col-md-3 control-label">Nome</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txtNome" runat="server" MaxLength="100" CssClass="form-control" ></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">Nº de Estudante</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txtNumMatricula" runat="server" CssClass="form-control" TextMode="Number" Width="100px"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">Nome do Pai</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txtNomePai" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">Nome da Mãe</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txtNomeMae" CssClass="form-control" runat="server" MaxLength="50"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">Genero</label>
                    <div class="col-md-9">
                        <asp:RadioButtonList ID="rblGenero" runat="server" CssClass="icheck" DataSourceID="SqlDataSourceGenero" DataTextField="Genero" DataValueField="Id_Genero" RepeatDirection="Horizontal"></asp:RadioButtonList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSourceGenero" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT * FROM [Tb_Genero]"></asp:SqlDataSource>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">Data de Nascimento</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txtDataNasc" runat="server" TextMode="Date" CssClass="form-control" Width="200px" placeholder="AAAA-MM-DD"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">Tipo de Documento</label>
                    <div class="col-md-9">
                        <asp:DropDownList ID="ddlTipoDoc" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceTipoDoc" DataTextField="TipoDoc" DataValueField="Id_TipoDoc" Width="200px"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSourceTipoDoc" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT * FROM [Tb_TipoDoc]"></asp:SqlDataSource>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">Número do Documento</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txtNumDoc" runat="server" CssClass="form-control" MaxLength="15" Width="200px"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">Contacto Telefonico</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txtTelf" runat="server" TextMode="Phone" CssClass="form-control" MaxLength="9" Width="200px"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">Email</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" TextMode="Email" Width="250px"></asp:TextBox>
                    </div>
                </div>



                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Curso</label>
                            <div class="col-md-9">
                                <asp:DropDownList ID="ddlCurso" runat="server" CssClass="form-control" Width="250px" DataSourceID="SqlDataSourceCurso" DataTextField="Curso" DataValueField="Id_Curso" AutoPostBack="True"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSourceCurso" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Turma.Id_Curso, Tb_Curso.Curso FROM Tb_Curso INNER JOIN Tb_Turma ON Tb_Curso.Id_Curso = Tb_Turma.Id_Curso GROUP BY Tb_Curso.Curso, Tb_Turma.Id_Curso, Tb_Turma.AnoLectivo HAVING (Tb_Turma.AnoLectivo = @AnoLectivo)" InsertCommand="AddPautas" InsertCommandType="StoredProcedure">
                                    <InsertParameters>
                                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                        <asp:Parameter Name="Id_Disciplina" Type="Int32" />
                                        <asp:Parameter Name="NumMatricula" Type="Int32" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:Parameter Name="AnoLectivo"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">Ano</label>
                            <div class="col-md-9">
                                <asp:DropDownList ID="ddlAno" runat="server" CssClass="form-control" Width="250px" DataSourceID="SqlDataSourceAno" DataTextField="Ano" DataValueField="Id_Ano" AutoPostBack="True"></asp:DropDownList>

                                <asp:SqlDataSource runat="server" ID="SqlDataSourceAno" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Ano.Id_Ano, Tb_Ano.Ano FROM Tb_Ano INNER JOIN Tb_Turma ON Tb_Ano.Id_Ano = Tb_Turma.Id_Ano WHERE (Tb_Turma.Id_Curso = @Id_Curso) GROUP BY Tb_Ano.Ano, Tb_Ano.Id_Ano, Tb_Turma.AnoLectivo HAVING (Tb_Turma.AnoLectivo = @AnoLectivo)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlCurso" PropertyName="SelectedValue" Name="Id_Curso"></asp:ControlParameter>
                                        <asp:Parameter Name="AnoLectivo"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">Turma</label>
                            <div class="col-md-9">
                                <asp:DropDownList ID="ddlTurma" runat="server" CssClass="form-control" Width="250px" DataSourceID="SqlDataSourceTurma" DataTextField="Turma" DataValueField="Id_Turma"></asp:DropDownList>

                                <asp:SqlDataSource runat="server" ID="SqlDataSourceTurma" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Id_Turma, Turma FROM Tb_Turma GROUP BY Id_Turma, Turma, Id_Ano, Id_Curso, AnoLectivo HAVING (Id_Ano = @Id_Ano) AND (Id_Curso = @Id_Curso) AND (AnoLectivo = @AnoLectivo)" InsertCommand="AddEstudante" InsertCommandType="StoredProcedure" OnInserted="SqlDataSourceTurma_Inserted">
                                    <InsertParameters>
                                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                        <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                        <asp:ControlParameter ControlID="txtNomePai" Name="NomePai" PropertyName="Text" Type="String" DefaultValue=" "/>
                                        <asp:ControlParameter ControlID="txtNomeMae" Name="NomeMae" PropertyName="Text" Type="String" DefaultValue=" " />
                                        <asp:ControlParameter ControlID="txtNumMatricula" Name="NumMatricula" PropertyName="Text" Type="Int32" />
                                        <asp:ControlParameter ControlID="txtDataNasc" Name="DataNasc" PropertyName="Text" DbType="Date" />
                                        <asp:ControlParameter ControlID="rblGenero" Name="Id_Genero" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlTipoDoc" Name="Id_TipoDoc" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="txtNumDoc" Name="NumDoc" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="txtTelf" Name="Telf" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="cbEspecial" Name="Especial" PropertyName="Checked" Type="Boolean" />
                                        <asp:ControlParameter ControlID="ddlTurma" Name="Id_Turma" PropertyName="SelectedValue" Type="Int32" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlAno" PropertyName="SelectedValue" Name="Id_Ano"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlCurso" PropertyName="SelectedValue" Name="Id_Curso"></asp:ControlParameter>
                                        <asp:Parameter Name="AnoLectivo"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>


                    </ContentTemplate>
                </asp:UpdatePanel>

                <div class="form-group">
                    <label class="col-md-3 control-label"></label>
                    <div class="col-md-9">
                        <asp:CheckBox ID="cbEspecial" CssClass="icheck" runat="server" Text="Estudante especial" />
                    </div>
                </div>
            </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
            <asp:LinkButton ID="btnOk" runat="server" CssClass="btn btn-success pull-right" OnClick="btnOk_Click"><i class="fa fa-plus"></i>&nbsp; Cadastrar Estudante</asp:LinkButton>
        </div>
        <!-- /.box-footer-->
    </div>
    <!-- /.box -->
</asp:Content>
