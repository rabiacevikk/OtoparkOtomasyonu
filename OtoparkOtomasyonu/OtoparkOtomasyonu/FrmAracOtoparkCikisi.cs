using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace OtoparkOtomasyonu
{
    public partial class FrmAracOtoparkCikisi : Form
    {
        public FrmAracOtoparkCikisi()
        {
            InitializeComponent();
        }
        SqlConnection baglanti = new SqlConnection("Data Source=DESKTOP-387VI6I\\MSSQLSERVER01;Initial Catalog=Arac_Otopark;Integrated Security=True");

        private void FrmAracOtoparkCikisi_Load(object sender, EventArgs e)
        {
            DoluYerler();
           Plakalar();
            timer1.Enabled = true;
        }

        private void Plakalar()                          //Comboboxa plakaları yazdırma
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("select * from arac_otopark_kaydi", baglanti);
            SqlDataReader read = komut.ExecuteReader();
            while (read.Read())
            {
                CmbPlakaAra.Items.Add(read["plaka"].ToString());
            }
            baglanti.Close();
        }

        private void DoluYerler()           //Comboboxa dolu yerleri yazdırma
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("select * from aracdurumu where durumu='DOLU'", baglanti);
            SqlDataReader read = komut.ExecuteReader();
            while (read.Read())
            {
                CmbParkYeri.Items.Add(read["parkyeri"].ToString());
            }
            baglanti.Close();
        }

        private void CmbPlakaAra_SelectedIndexChanged(object sender, EventArgs e)  //Seçilen plakaın yerini yazdırma
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("select * from arac_otopark_kaydi where plaka ='" + CmbPlakaAra.SelectedItem + "'",baglanti);
                SqlDataReader read = komut.ExecuteReader();
            while (read.Read())
            {
                TxtParkYeri.Text = read["parkyeri"].ToString();
            }
            baglanti.Close();
        }

        private void CmbParkYeri_SelectedIndexChanged(object sender, EventArgs e)     
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("select * from arac_otopark_kaydi where parkyeri='" + CmbParkYeri.SelectedItem + "'", baglanti);
            SqlDataReader read = komut.ExecuteReader();
            while (read.Read())
            {
                TxtParkYeri2.Text = read["parkyeri"].ToString();  //veritabanındaki bilgileri textboxlara yazdırma
                TxtTC.Text = read["tc"].ToString();
                TxtAd.Text = read["ad"].ToString();
                TxtSoyad.Text = read["soyad"].ToString();
                TxtMarka.Text = read["marka"].ToString();
                TxtSeri.Text = read["seri"].ToString();
                TxtPlaka.Text = read["plaka"].ToString();
                LblGelisTarihi.Text = read["tarih"].ToString();
            }
            baglanti.Close();
            DateTime gelis, cikis;
            gelis = DateTime.Parse(LblGelisTarihi.Text);
            cikis = DateTime.Parse(LblCikisTarihi.Text);
            TimeSpan fark; //Aradaki fark için
            fark = cikis - gelis;
            LblSure.Text = fark.TotalHours.ToString("0.00");
            LblToplamTutar.Text = (double.Parse(LblSure.Text) * (0.75)).ToString("0.00");
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            LblCikisTarihi.Text = DateTime.Now.ToString();
        }

        private void BtnAracCikisi_Click(object sender, EventArgs e)
        {
            baglanti.Open();  //Çıkış yapan aracın kayıt bilgilerini silme 
            SqlCommand komut = new SqlCommand("delete  from arac_otopark_kaydi where plaka='" + TxtPlaka.Text + "'", baglanti);
            komut.ExecuteNonQuery();

            //Çıkış yapan aracın park yerini boş olarak güncelleme
            SqlCommand komut2 = new SqlCommand("update  aracdurumu set durumu='BOŞ' where parkyeri='" + TxtParkYeri2.Text + "'", baglanti);
            komut2.ExecuteNonQuery();
            //Çıkış yaptığı zaman bilgilerini alma
            SqlCommand komut3 = new SqlCommand("insert into satis(parkyeri,plaka,gelis_tarihi,cikis_tarihi,sure,tutar) values (@parkyeri,@plaka,@gelis_tarihi,@cikis_tarihi,@sure,@tutar)", baglanti);
            komut3.Parameters.AddWithValue("@parkyeri", TxtParkYeri2.Text);
            komut3.Parameters.AddWithValue("@plaka", TxtPlaka.Text);
            komut3.Parameters.AddWithValue("@gelis_tarihi", LblGelisTarihi.Text);
            komut3.Parameters.AddWithValue("@cikis_tarihi", LblCikisTarihi.Text);
            komut3.Parameters.AddWithValue("@sure", double.Parse(LblSure.Text));
            komut3.Parameters.AddWithValue("@tutar", double.Parse(LblToplamTutar.Text));
            komut3.ExecuteNonQuery();

            baglanti.Close();
            MessageBox.Show("Araç Çıkışı Yapıldı");
            foreach (Control item in groupBox3.Controls)
            {
                if (item is TextBox)
                {
                    item.Text = "";
                    TxtParkYeri.Text = "";
                    CmbParkYeri.Text = "";
                   CmbPlakaAra.Text = "";
                }
            }
            CmbPlakaAra.Items.Clear();
            CmbParkYeri.Items.Clear();
            DoluYerler();
            Plakalar();
        }

        private void BtnIptal_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}