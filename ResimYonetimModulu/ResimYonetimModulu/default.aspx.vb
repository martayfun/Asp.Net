Imports System.IO

Public Class _default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Return
        End If
        ddResim.DataValueField = "resimId"
        ddResim.DataTextField = "resimAdi"
        ddResim.DataSource = dtGetir("select * from resimler")
        ddResim.DataBind()

        kayitGetir()

    End Sub

    Private Sub kayitGetir()
        gvResimler.DataSource = dtGetir("select * from resimler")
        gvResimler.DataBind()

        rptImlec.DataSource = dtGetir("select * from resimler")
        rptImlec.DataBind()

        rptResimler.DataSource = dtGetir("select * from resimler")
        rptResimler.DataBind()
    End Sub
    Protected Sub btnKaydet_Click(sender As Object, e As EventArgs) Handles btnKaydet.Click
        If txtAdY.Text = "" Or txtAciklamaY.Text = "" Then
            lbSonuc.Text = "Lütfen Resim Adı ve Açıklaması Giriniz!"
            lbSonuc.CssClass = "alert alert-danger"
            Return
        End If
        If fuResim.HasFile Then
            Dim uzanti As String = Path.GetExtension(fuResim.FileName).ToLower
            If uzanti = ".jpg" Or uzanti = ".png" Or uzanti = ".gif" Then
                Dim dosyaAdi As String = String.Format("{0:yyyyMMddhhmmss}", Now) & uzanti
                fuResim.SaveAs(Server.MapPath("/Resimler/" & dosyaAdi))
                sqlCalistir("insert into resimler (resimAdi,resimAciklama,resimYol) values ('" & txtAdY.Text & "','" & txtAciklamaY.Text & "','" & dosyaAdi & "')")
                lbSonuc.Text = "Resim Eklendi"
                lbSonuc.CssClass = "alert alert-success"
            Else
                lbSonuc.Text = "Lütfen JPG,PNG veya GIF Türünde Resim Seçiniz!"
                lbSonuc.CssClass = "alert alert-danger"
            End If
        Else
            lbSonuc.Text = "Lütfen Bir Resim Seçiniz!"
            lbSonuc.CssClass = "alert alert-danger"
        End If
    End Sub

    Protected Sub gvResimler_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles gvResimler.RowEditing
        gvResimler.EditIndex = e.NewEditIndex
        kayitGetir()
    End Sub

    Protected Sub gvResimler_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gvResimler.RowDeleting
        Dim ltId As Literal = gvResimler.Rows(e.RowIndex).FindControl("ltId")
        Dim resimId As Integer = Convert.ToInt32(ltId.Text)
        Dim dt As DataTable = dtGetir("select * from resimler where resimId=" & resimId)
        Dim resimYol As String = dt(0)("resimYol").ToString()

        If File.Exists(Server.MapPath("/Resimler/" & resimYol)) Then
            File.Delete(Server.MapPath("/Resimler/" & resimYol))
        End If
        sqlCalistir("delete from resimler where resimId=" & resimId)

        kayitGetir()
    End Sub

    Protected Sub gvResimler_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gvResimler.RowUpdating
        Dim ltId As Literal = gvResimler.Rows(e.RowIndex).FindControl("ltId")
        Dim txtAd As Literal = gvResimler.Rows(e.RowIndex).FindControl("txtAd")
        Dim txtAciklama As TextBox = gvResimler.Rows(e.RowIndex).FindControl("txtAciklama")
        Dim resimId As Integer = Convert.ToInt32(ltId.Text)

        sqlCalistir("update resimler set resimAdi='" & txtAd.Text & "',resimAciklama='" & txtAciklama.Text & "',where resimId=" & resimId)
        gvResimler.EditIndex = -1
        kayitGetir()
    End Sub

    Protected Sub gvResimler_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles gvResimler.RowCancelingEdit
        gvResimler.EditIndex = -1
        kayitGetir()
    End Sub
End Class