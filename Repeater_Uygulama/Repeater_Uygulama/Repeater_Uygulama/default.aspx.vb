Public Class _default
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsPostBack Then
            Return
        End If
        kayitGetir()
    End Sub
    Sub kayitGetir()
        rptOgrenci.DataSource = dtGetir("select * from ogrenci order by ogrId desc")
        rptOgrenci.DataBind()
    End Sub
    Protected Sub btnKaydet_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnKaydet.Click
        sqlCalistir("insert into ogrenci (adsoyad,mail,yas) values ('" & txtAdsoyad.Text & "','" & txtMail.Text & "'," & Convert.ToInt32(txtYas.Text) & ")")
        lbSonuc.Text = "Kayıt Eklendi"
        lbSonuc.CssClass = "alert alert-success"
        kayitGetir()
    End Sub
    Protected Sub rptOgrenci_ItemCommand(ByVal source As Object, ByVal e As RepeaterCommandEventArgs) Handles rptOgrenci.ItemCommand
        If e.CommandName = "cmdSil" Then
            Dim ogrId As Integer = Convert.ToInt32(e.CommandArgument.ToString())
            sqlCalistir("delete from ogrenci where ogrId=" & ogrId)
            kayitGetir()
        End If
    End Sub
End Class