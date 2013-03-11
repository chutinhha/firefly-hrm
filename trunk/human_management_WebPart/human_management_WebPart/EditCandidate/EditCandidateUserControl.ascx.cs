using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;
using System.Globalization;
using System.Data;
using System.Data.SqlClient;

namespace SP2010VisualWebPart.EditCandidate
{
    public partial class EditCandidateUserControl : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                DropDownList1.DataSource = getCountryList();
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, "Select");
                this.SetItemList("VacancyName", "HumanResources.JobVacancy", DropDownList2);
                this.SetItemList("JobTitle", "HumanResources.JobTitle", DropDownList3);
                this.SetItemList("Status", "HumanResources.CandidateStatus", DropDownList4);
                Calendar1.Visible = false;

                string connetionString = null;
                SqlConnection cnn;
                connetionString = "Data Source=localhost;Initial Catalog=AdventureWorks2008R2;User ID=hr;Password=123456";
                cnn = new SqlConnection(connetionString);
                try
                {
                    cnn.Open();
                    string sql = @"SELECT * from HumanResources.JobCandidate where FullName=N'"+Session["Name"]+"' and Email='"+Session["Email"]+"';";
                    SqlDataAdapter da = new SqlDataAdapter(sql, cnn);
                    // Tạo DataSet
                    DataSet ds = new DataSet();
                    // Lấp đầy kết quả vào DataSet
                    da.Fill(ds, "candidates");
                    // Tạo DataTable thu kết quả từ bảng
                    DataTable dt = ds.Tables["candidates"];
                    if (dt.Rows.Count > 0)
                    {
                        TextBox1.Text = dt.Rows[0][0].ToString().Trim();
                        TextBox2.Text = dt.Rows[0][1].ToString().Trim();
                        TextBox3.Text = dt.Rows[0][2].ToString().Trim();
                        TextBox4.Text = dt.Rows[0][3].ToString().Trim();
                        TextBox5.Text = dt.Rows[0][4].ToString().Trim();
                        DropDownList1.SelectedValue = dt.Rows[0][5].ToString().Trim();
                        TextBox6.Text = dt.Rows[0][6].ToString().Trim();
                        TextBox7.Text = dt.Rows[0][7].ToString().Trim();
                        TextBox8.Text = dt.Rows[0][8].ToString().Trim();
                        TextBox9.Text = dt.Rows[0][9].ToString().Trim();
                        DropDownList2.SelectedValue = dt.Rows[0][10].ToString().Trim();
                        TextBox10.Text = dt.Rows[0][11].ToString().Trim();
                        DropDownList3.SelectedValue = dt.Rows[0][14].ToString().Trim();
                        TextBox11.Text = dt.Rows[0][15].ToString().Trim();
                        DropDownList4.SelectedValue = dt.Rows[0][16].ToString().Trim();
                        DropDownList5.SelectedValue = dt.Rows[0][17].ToString().Trim();
                        TextBox12.Text = dt.Rows[0][13].ToString().Trim();
                        TextBox13.Text = dt.Rows[0][12].ToString().Trim();
                    }
                    cnn.Close();
                    Label19.Text = "";
                }
                catch (Exception ex)
                {
                }
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
            Response.Redirect("Candidates.aspx",true);
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
                string sql = @"update HumanResources.JobCandidate set FullName=N'"+TextBox1.Text+"',"
                    +"AddressStreet=N'"+TextBox2.Text+"',City=N'"+TextBox3.Text+"',"
                    +"State=N'"+TextBox4.Text+"',ZipCode='"+TextBox5.Text+"',"
                    +"Country='"+DropDownList1.SelectedValue+"',HomePhone="+TextBox6.Text
                    +",Mobile="+TextBox7.Text+",WorkPhone="+TextBox8.Text+",Email='"+TextBox9.Text+"',"
                    +"JobVacancy='"+DropDownList2.SelectedValue+"',Keywords=N'"+TextBox10.Text+"',"
                    +"JobTitle='"+DropDownList3.SelectedValue+"',HiringManager=N'"+TextBox11.Text+"',"
                    +"Status='"+DropDownList4.SelectedValue+"',MethodOfApply='"+DropDownList5.SelectedValue+"',"
                    +"ApplyDate='"+TextBox12.Text+"',Comment=N'"+TextBox13.Text+"' where FullName=N'"+Session["Name"]
                    +"' and Email='"+Session["Email"]+"';";
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
