<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default.aspx.vb" Inherits="ResimYonetimModulu._default" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Teknik</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Ana sayfa</a></li>
                        <li><a href="#">Hakkında</a></li>
                        <li><a href="#">iletişim</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div><!--/.container-fluid -->
        </nav>


    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <asp:Repeater ID="rptImlec" runat="server">
                <ItemTemplate>
                    <li data-target="#carousel-example-generic" data-slide-to='<%#Container.ItemIndex %>'></li>
                </ItemTemplate>
            </asp:Repeater>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
        <asp:Repeater ID="rptResimler" runat="server">
            <ItemTemplate>
                <div class="item">
                    <img src="Resimler/<%#Eval("resimYol") %>" />
                    <div class="carousel-caption">
                        <h1><%#Eval("resimAdi") %></h1>
                        <%#Eval("resimAciklama") %>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        </div>
        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Geri</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">İleri</span>
        </a>
    </div>


    <div class="container"><!--Ana Dizin-->
        <div class="row">
        <div class="col-lg-3 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="#">Ana Sayfa </a></li>
                <li><a href="#">Hakkında</a></li>
                <li><a href="#">İletişim</a></li>
            </ul>
        </div>
        <div class="col-lg-9">
            <h1>Resim Ekleme</h1><hr />
            <table class="table">
                <tr>
                    <td><b>Resim Adı</b></td>
                    <td><asp:TextBox ID="txtAdY" runat="server" CssClass="form-control"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><b>Resim Açıklaması</b></td>
                    <td><asp:TextBox ID="txtAciklamaY" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox></td>
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
            <asp:DropDownList ID="ddResim" runat="server" Height="16px" Width="255px">
            </asp:DropDownList>
            <hr />
            <h1>Resim Yönetimi</h1>
            <asp:GridView ID="gvResimler" runat="server" AutoGenerateColumns="False" CssClass="table table-hover">
            <Columns>
                <asp:TemplateField HeaderText="Resim">
                    
                    <ItemTemplate>
                        <asp:Image ID="imgResim" runat="server" ImageUrl='<%#"Resimler/" + Eval("resimYol") %>' Width="50" Height="50" />
                    </ItemTemplate>
                    
                </asp:TemplateField>
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
    </div>
    </div>
        <footer class="footer">
            <div class="container">
                <hr />
                <p class="text-info">Tüm Hakları Saklıdır <br /> Antalya 2016</p>
            </div>
        </footer>
    </form>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/carousel.js"></script>
    <script>
        $(".item:first").addClass("active");
        $(".carousel-indicators li:first").addClass("active");
    </script>
</body>
</html>
