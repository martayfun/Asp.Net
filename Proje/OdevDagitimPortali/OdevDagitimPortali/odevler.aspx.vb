Public Class odevler
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Return
        End If
        kayitGetir()
    End Sub
    Private Sub kayitGetir()
        gvResimler.DataSource = dtGetir("select * from odevler")
        gvResimler.DataBind()

        'rptImlec.DataSource = dtGetir("select * from ogrenciler")
        'rptImlec.DataBind()

    End Sub

    Protected Sub btnKaydet_Click(sender As Object, e As EventArgs) Handles btnKaydet.Click
        If txtAdi.Text = "" Or txtOdevkonu.Text = "" Then
            lbSonuc.Text = "Lütfen Boş Alan Bırakmayınız!"
            lbSonuc.CssClass = "alert alert-danger"
            Return
        End If
        sqlCalistir("insert into odevler (dersId,odevKonu) values ('" & txtAdi.Text & "','" & txtOdevkonu.Text & "')")
        lbSonuc.Text = "Ödev Eklendi"
        lbSonuc.CssClass = "alert alert-success"
    End Sub
End Class