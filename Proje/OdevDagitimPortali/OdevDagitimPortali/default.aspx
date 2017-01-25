<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="default.aspx.vb" Inherits="OdevDagitimPortali._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="col-lg-9">
<h1>Ödev Dağılımı</h1>
<asp:GridView ID="gvResimler" runat="server" AutoGenerateColumns="False" CssClass="table table-hover">
<Columns>
<asp:TemplateField HeaderText="Id">
<ItemTemplate>
<asp:Literal ID="ltId" runat="server" Text='<%#Eval("resimId") %>'></asp:Literal>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Resim Adı">
<EditItemTemplate>
<asp:TextBox ID="txtAd" runat="server" CssClass="form-control" Text='<%#Eval("resimAdi") %>'></asp:TextBox>
</EditItemTemplate>
<ItemTemplate>
<asp:Literal ID="ltAd" runat="server" Text='<%#Eval("resimAdi") %>'></asp:Literal>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Resim Açıklama">
<EditItemTemplate>
<asp:TextBox ID="txtAciklama" CssClass="form-control" TextMode="MultiLine" Rows="3" runat="server" Text='<%#Eval("resimAciklama") %>'></asp:TextBox>
</EditItemTemplate>
<ItemTemplate>
<asp:Literal ID="ltAciklama" runat="server" Text='<%#Eval("resimAciklama") %>'></asp:Literal>
</ItemTemplate>
</asp:TemplateField>
<asp:CommandField ButtonType="Button" CancelText="İptal" DeleteText="Sil" EditText="Düzenle" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Kaydet">
<ControlStyle CssClass="btn btn-warning" />
</asp:CommandField>
</Columns>
</asp:GridView>
</div>
</asp:Content>
