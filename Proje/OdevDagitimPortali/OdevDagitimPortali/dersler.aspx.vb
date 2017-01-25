Public Class dersler
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Return
        End If
        kayitGetir()
    End Sub

    Protected Sub btnKaydet_Click(sender As Object, e As EventArgs) Handles btnKaydet.Click
        If txtAdi.Text = "" Then
            lbSonuc.Text = "Lütfen Ders Adı Giriniz!"
            lbSonuc.CssClass = "alert alert-danger"
            Return
        End If
        sqlCalistir("insert into dersler (dersAdi) values ('" & txtAdi.Text & "')")
        lbSonuc.Text = "Ders Eklendi"
        lbSonuc.CssClass = "alert alert-success"
    End Sub
    Private Sub kayitGetir()
        gvResimler.DataSource = dtGetir("select * from dersler")
        gvResimler.DataBind()

        'rptImlec.DataSource = dtGetir("select * from ogrenciler")
        'rptImlec.DataBind()

    End Sub
End Class