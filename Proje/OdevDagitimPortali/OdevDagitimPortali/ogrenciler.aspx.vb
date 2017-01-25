Imports System.IO

Public Class ogrenciler
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Return
        End If
        kayitGetir()
    End Sub
    Private Sub kayitGetir()
        gvResimler.DataSource = dtGetir("select * from ogrenciler")
        gvResimler.DataBind()

        'rptImlec.DataSource = dtGetir("select * from ogrenciler")
        'rptImlec.DataBind()

    End Sub

    Protected Sub btnKaydet_Click(sender As Object, e As EventArgs) Handles btnKaydet.Click
        If txtOgrno.Text = "" Or txtAdsoyad.Text = "" Or txtbolum.Text = "" Then
            lbSonuc.Text = "Lütfen Boş Alan Bırakmayınız!"
            lbSonuc.CssClass = "alert alert-danger"
            Return
        End If
        If fuResim.HasFile Then
            Dim uzanti As String = Path.GetExtension(fuResim.FileName).ToLower
            If uzanti = ".jpg" Or uzanti = ".png" Or uzanti = ".gif" Then
                Dim dosyaAdi As String = String.Format("{0:yyyyMMddhhmmss}", Now) & uzanti
                fuResim.SaveAs(Server.MapPath("/Resimler/" & dosyaAdi))
                sqlCalistir("insert into ogrenciler (ogrNo,ogrAdsoyad,ogrBolum,ogrResimyol) values ('" & txtOgrno.Text & "','" & txtAdsoyad.Text & "','" & txtbolum.Text & "','" & dosyaAdi & "')")
                lbSonuc.Text = "Öğrenci Eklendi"
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
End Class