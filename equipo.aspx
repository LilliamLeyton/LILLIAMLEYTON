﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/menu.Master" CodeBehind="equipo.aspx.vb" Inherits="EQUIPO.Formulario_web12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container text-center">
    <h1> Equipos </h1>
    <p>&nbsp;</p>
</div>
<div>
    <br />
    <br />
    <asp:GridView runat="server" ID="datagrid" PageSize="10" HorizontalAlign="Center"
        CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
        RowStyle-CssClass="rows" AllowPaging="True" />

    <br />
    <br />
    <br />

</div>
<div class="container text-center">
    Codigo: <asp:TextBox ID="tcodigo" class="form-control" runat="server"></asp:TextBox>
    
     <div class="mb-3">
     <label for="exampleInputPassword1" class="form-label">Tipo de Equipos</label>
     <asp:DropDownList ID="DropDownList1" class="form-control" runat="server"></asp:DropDownList>
 </div>
    Descripcion: <asp:TextBox ID="tdescripcion" class="form-control" runat="server"></asp:TextBox>
    precio: <asp:TextBox ID="tprecio" class="form-control" runat="server"></asp:TextBox>
</div>
<div class="container text-center">

    <asp:Button ID="Button1" class="btn btn-outline-primary" runat="server" Text="Agregar" OnClick="Button1_Click" />
    <asp:Button ID="Button2" class="btn btn-outline-secondary" runat="server" Text="Borrar" />
    <asp:Button ID="Button3" runat="server" class="btn btn-outline-danger" Text="Modificar" />
    <asp:Button ID="Bconsulta" runat="server" class="btn btn-outline-danger" Text="Consultar" />
    
    

</div>
</asp:Content>