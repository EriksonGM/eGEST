<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="CadastrarEstudante.aspx.cs" Inherits="eGEST.SecEstudantes.CadastrarEstudante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitle" runat="server">
    Cadastro de Estudante
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" runat="server">
    <!-- Default box -->
    <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title">Formulario de Cadastro</h3>
            <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Minimizar"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Fechar"><i class="fa fa-times"></i></button>
            </div>
        </div>
        <div class="box-body row">
            <div class="form-group col-md-6">
                <label for="exampleInputEmail1">Email address</label>
                <input type="email" class="form-control " id="exampleInputEmail1" placeholder="Enter email">
            </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
            <asp:LinkButton ID="btnCadastrar" CssClass="btn btn-success pull-right" runat="server"><i class="fa fa-plus"></i>&nbsp; Cadastrar</asp:LinkButton>
        </div>
        <!-- /.box-footer-->
    </div>
    <!-- /.box -->
</asp:Content>
