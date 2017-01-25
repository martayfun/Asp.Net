<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default.aspx.vb" Inherits="Repeater_Uygulama._default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta name="viewport" content="width=device-width, initial-scale=1"/>
     <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
     <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
     <script src="https://code.jquery.com/jquery-latest.js"></script>
     <script src="js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
 <div class="container" style="margin-top:30px;">
 <div class="jumbotron"><h3>ASP.Net Veri Tabanı Örneği</h3><small>Repeater
Kullanımı</small></div>
 <div class="row">
 <div class="col-md-8">
 <h3>Kayıtlar</h3>
 <table class="table table-hover">
 <tr>
 <td><b>Sıra No</b></td>
 <td><b>Kayıt No</b></td>
 <td><b>Adı Soyadı</b></td>
 <td><b>E-Posta</b></td>
 <td><b>Yaş</b></td>
 <td><b>Sil</b></td>
 </tr>
<asp:Repeater ID="rptOgrenci" runat="server">
 <ItemTemplate>
 <tr>
 <td><%#Container.ItemIndex + 1 %></td>
 <td><%#Eval("ogrId") %></td>
 <td><%#Eval("adsoyad") %></td>
 <td><%#Eval("mail") %></td>
 <td><%#Eval("yas") %></td>
 <td><asp:Button ID="btnSil" CommandName="cmdSil"
CommandArgument='<%#Eval("ogrId") %>' runat="server" CssClass="btn btn-danger"
Text="Sil" /></td>
 </tr>
 </ItemTemplate>
</asp:Repeater>


 </table>
 </div>
 <div class="col-md-4">
 <h3>Yeni Kayıt Ekle</h3>
 <label>Adı Soyadı</label><br />
 <asp:TextBox ID="txtAdsoyad" runat="server" CssClass="forminline"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
ID="RequiredFieldValidator1"
runat="server" ErrorMessage="Ad Soyad Giriniz" CssClass="text-danger"
ControlToValidate="txtAdsoyad" ValidationGroup="y"></asp:RequiredFieldValidator><br />
 <label>E-Posta</label><br />
 <asp:TextBox ID="txtMail" runat="server" CssClass="forminline"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
ID="RequiredFieldValidator2"
runat="server" ErrorMessage="E-Posta Giriniz" CssClass="text-danger"
ControlToValidate="txtMail" ValidationGroup="y"></asp:RequiredFieldValidator><br />
 <label>Yaş</label><br />
 <asp:TextBox ID="txtYas" runat="server" CssClass="form-inline"
Width="39px"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
ID="RequiredFieldValidator3" runat="server" ErrorMessage="Yaş Giriniz" CssClass="textdanger"
ControlToValidate="txtYas"
ValidationGroup="y"></asp:RequiredFieldValidator><br /><br />
 <asp:Label ID="lbSonuc" runat="server"></asp:Label><br /><br />
 <asp:Button ID="btnKaydet" runat="server" Text="Kaydet" CssClass="btn btn-success"
ValidationGroup="y" />
 </div>
 </div>
 </div>
 </form>
</body>
</html>
