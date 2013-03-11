using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;
using System.Globalization;
using System.Data;
using System.Data.SqlClient;

namespace SP2010VisualWebPart.AddCandidate
{
    public partial class AddCandidateUserControl : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.DataSource = getCountryList();
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, "Select");
                this.SetItemList("JobTitle", "HumanResources.JobTitle", DropDownList3);
                this.SetItemList("VacancyName", "HumanResources.JobVacancy", DropDownList2);
                this.SetItemList("Status", "HumanResources.CandidateStatus", DropDownList4);
                Calendar1.Visible = false;
                Label19.Text = "";
            }
        }
        public List<string> getCountryList()
        {
            List<string> cultureList = new List<string>();
            CultureInfo[] cultures = CultureInfo.GetCultures(CultureTypes.AllCultures & ~CultureTypes.NeutralCultures);
            foreach (CultureInfo culture in cultures)
            {
                if (culture.LCID != 127)
                {
                    RegionInfo region = new RegionInfo(culture.LCID);
                    //RegionInfo region = new RegionInfo(culture.LCID);
                    if (!(cultureList.Contains(region.EnglishName)))
                    {
                        cultureList.Add(region.EnglishName);
                    }
                }
            }
            cultureList.Sort(); //put the country list in alphabetic order.
            return cultureList;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox12.Text = Calendar1.SelectedDate.Date.ToString();
            Calendar1.Visible = false;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Candidates.aspx", true);
        }

        public void SetItemList(string column, string table, DropDownList ddl)
        {
            ddl.Items.Clear();
            string connetionString = null;
            SqlConnection cnn;
            connetionString = "Data Source=localhost;Initial Catalog=AdventureWorks2008R2;User ID=hr;Password=123456";
            cnn = new SqlConnection(connetionString);
            try
            {
                cnn.Open();
                string sql = @"SELECT distinct " + column + " FROM " + table;
                SqlDataAdapter da = new SqlDataAdapter(sql, cnn);
                // Tạo DataSet
                DataSet ds = new DataSet();
                // Lấp đầy kết quả vào DataSet
                da.Fill(ds, "items");
                // Tạo DataTable thu kết quả từ bảng
                DataTable dt = ds.Tables["items"];
                if (dt.Rows.Count > 0)
                {
                    ddl.Items.Add("All");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        ddl.Items.Add(dt.Rows[i][0].ToString());
                    }
                }
                cnn.Close();
            }
            catch (Exception ex)
            {
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            string connetionString = null;
            SqlConnection cnn;
            connetionString = "Data Source=localhost;Initial Catalog=AdventureWorks2008R2;User ID=hr;Password=123456";
            cnn = new SqlConnection(connetionString);
            try
            {
                cnn.Open();
                string sql = @"insert into HumanResources.JobCandidate values(N'" + TextBox1.Text + "',"
                    + "N'" + TextBox2.Text + "',N'" + TextBox3.Text + "',"
                    + "N'" + TextBox4.Text + "','" + TextBox5.Text + "',"
                    + "'" + DropDownList1.SelectedValue + "'," + TextBox6.Text
                    + "," + TextBox7.Text + "," + TextBox8.Text + ",'" + TextBox9.Text + "',"
                    + "'" + DropDownList2.SelectedValue + "',N'" + TextBox10.Text + "',"
                    + "N'" + TextBox13.Text + "','" + TextBox12.Text + "','" + DropDownList3.SelectedValue + "',"
                    + "N'" + TextBox11.Text + "',"
                    + "'" + DropDownList4.SelectedValue + "','" + DropDownList5.SelectedValue + "');";
                SqlCommand command = new SqlCommand(sql, cnn);
                //command.Connection.Open();
                command.ExecuteNonQuery();
                cnn.Close();
                Response.Redirect("Candidates.aspx", true);
            }
            catch (Exception ex)
            {
                Label19.Text = ex.Message;
            }
        }
    }
}
