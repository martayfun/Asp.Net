<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="ogrenciler.aspx.vb" Inherits="OdevDagitimPortali.ogrenciler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div class="col-lg-9">
<h1>Öğrenci Ekleme</h1><hr />
<table class="table">
<tr>
<td><b>Öğrenci Numarası</b></td>
<td><asp:TextBox ID="txtOgrno" runat="server" CssClass="form-control"></asp:TextBox></td>
</tr>
<tr>
<td><b>Adı Soyadı</b></td>
<td><asp:TextBox ID="txtAdsoyad" runat="server" CssClass="form-control"></asp:TextBox></td>
</tr>
<tr>
<td><b>Öğrenci Bölümü</b></td>
<td><asp:TextBox ID="txtbolum" runat="server" CssClass="form-control"></asp:TextBox></td>
</tr>
<tr>
    <td><b>Resim Seçiniz</b></td>
<td><asp:FileUpload ID="fuResim" runat="server" CssClass="form-control"></asp:FileUpload></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><asp:Button ID="btnKaydet" runat="server" CssClass="btn btn-primary" Text="Kaydet"></asp:Button></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><br /><asp:Label ID="lbSonuc" runat="server"></asp:Label></td>
</tr>
</table>
<hr />
<h1>Öğrenci Yönetimi</h1>
<asp:GridView ID="gvResimler" runat="server" AutoGenerateColumns="False" CssClass="table table-hover">
<Columns>
    <asp:TemplateField HeaderText="Resim">
        <ItemTemplate>
            <asp:Image ID="imgResim" runat="server" ImageUrl='<%#"Resimler/" + Eval("ogrResimYol") %>' Width="50" Height="50" />
        </ItemTemplate>
    </asp:TemplateField>
<asp:TemplateField HeaderText="Id">
<ItemTemplate>
<asp:Literal ID="ltId" runat="server" Text='<%#Eval("ogrId") %>'></asp:Literal>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Öğrenci No">
<EditItemTemplate>
<asp:TextBox ID="txtOgrno" runat="server" CssClass="form-control" Text='<%#Eval("ogrNo") %>'></asp:TextBox>
</EditItemTemplate>
<ItemTemplate>
<asp:Literal ID="ltOgrno" runat="server" Text='<%#Eval("ogrNo") %>'></asp:Literal>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Ad Soyad">
<EditItemTemplate>
<asp:TextBox ID="txtAdsoyad" CssClass="form-control"  runat="server" Text='<%#Eval("ogrAdsoyad") %>'></asp:TextBox>
</EditItemTemplate>
<ItemTemplate>
<asp:Literal ID="ltAdsoyad" runat="server" Text='<%#Eval("ogrAdsoyad") %>'></asp:Literal>
</ItemTemplate>
</asp:TemplateField>
    <asp:TemplateField HeaderText="Bölüm">

        <EditItemTemplate>
        <asp:TextBox ID="txtBolum" CssClass="form-control" TextMode="MultiLine" Rows="3" runat="server" Text='<%#Eval("ogrBolum") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
        <asp:Literal ID="ltBolum" runat="server" Text='<%#Eval("ogrBolum") %>'></asp:Literal>
        </ItemTemplate>

    </asp:TemplateField>
<asp:CommandField ButtonType="Button" CancelText="İptal" DeleteText="Sil" EditText="Düzenle" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Kaydet">
<ControlStyle CssClass="btn btn-warning" />
</asp:CommandField>
</Columns>
</asp:GridView>
</div>

</asp:Content>
