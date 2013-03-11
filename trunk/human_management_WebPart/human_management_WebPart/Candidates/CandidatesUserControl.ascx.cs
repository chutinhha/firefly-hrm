using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;

namespace SP2010VisualWebPart.Candidates
{
    public partial class CandidatesUserControl : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.SetItemList("JobTitle", "HumanResources.JobTitle", DropDownList1);
                this.SetItemList("VacancyName", "HumanResources.JobVacancy", DropDownList2);
                this.SetItemList("Status", "HumanResources.Candidatestatus", DropDownList3);
                bindData("JobVacancy,FullName,HiringManager,Email,ApplyDate,Status", "");
                Calendar1.Visible = false;
                Calendar2.Visible = false;
            }
        }

        public void SetItemList(string column, string table, DropDownList ddl) {
            ddl.Items.Clear();
            string connetionString = null;
            SqlConnection cnn;
            connetionString = "Data Source=localhost;Initial Catalog=AdventureWorks2008R2;User ID=hr;Password=123456";
            cnn = new SqlConnection(connetionString);
            try
            {
                cnn.Open();
                string sql = @"SELECT distinct "+column+" FROM "+table;
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
                    for (int i = 0; i < dt.Rows.Count; i++) {
                        ddl.Items.Add(dt.Rows[i][0].ToString());
                    }
                }
                cnn.Close();
            }
            catch (Exception ex)
            {
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void Calendar1_SelectionChanged1(object sender, EventArgs e)
        {
            TextBox4.Text = Calendar1.SelectedDate.Date.ToString();
            Calendar1.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Calendar2.Visible = true;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            DropDownList3.SelectedIndex = 0;
            DropDownList4.SelectedIndex = 0;
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            Calendar1.Visible = false;
            Calendar2.Visible = false;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            TextBox5.Text = Calendar2.SelectedDate.Date.ToString();
            Calendar2.Visible = false;
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string condition = " where ";
            if (DropDownList1.SelectedValue == "All") { }
            else {
                condition = condition + "JobTitle='" + DropDownList1.SelectedItem.Text + "' and ";
            }
            if (DropDownList2.SelectedItem.Text == "All") { }
            else
            {
                condition = condition + "JobVacancy='" + DropDownList2.SelectedItem.Text + "' and ";
            }
            if (DropDownList3.SelectedItem.Text == "All") { }
            else
            {
                condition = condition + "Status='" + DropDownList3.SelectedItem.Text + "' and ";
            }
            if (DropDownList4.SelectedItem.Text == "All") { }
            else
            {
                condition = condition + "MethodOfApply='" + DropDownList4.SelectedItem.Text + "' and ";
            }
            if (TextBox1.Text.Trim()=="") { }
            else
            {
                condition = condition + "HiringManager like'%" + TextBox1.Text + "%' and ";
            }
            if (TextBox2.Text.Trim() == "") { }
            else
            {
                condition = condition + "FullName like'%" + TextBox2.Text + "%' and ";
            }
            if (TextBox3.Text.Trim() == "") { }
            else
            {
                condition = condition + "Keywords like'%" + TextBox3.Text + "%' and ";
            }
            if (TextBox4.Text.Trim() == "") { }
            else
            {
                condition = condition + "ApplyDate > '" + TextBox4.Text + "' and ";
            }
            if (TextBox5.Text.Trim() == "") { }
            else
            {
                condition = condition + "ApplyDate < '" + TextBox5.Text + "' and ";
            }
            if(condition == " where "){
                condition="";
            }else{
                condition = condition.Substring(0, condition.Length - 4);
            }
            bindData("JobVacancy,FullName,HiringManager,Email,ApplyDate,Status", condition);
        }

        public void bindData(string column, string condition) {
            string connetionString = null;
            SqlConnection cnn;
            connetionString = "Data Source=localhost;Initial Catalog=AdventureWorks2008R2;User ID=hr;Password=123456";
            cnn = new SqlConnection(connetionString);
            try
            {
                cnn.Open();
                string sql = @"SELECT "+column+" from HumanResources.JobCandidate" + condition+";";
                SqlDataAdapter da = new SqlDataAdapter(sql, cnn);
                // Tạo DataSet
                DataSet ds = new DataSet();
                // Lấp đầy kết quả vào DataSet
                da.Fill(ds, "candidate");
                // Tạo DataTable thu kết quả từ bảng
                DataTable dt = ds.Tables["candidate"];
                GridView1.DataSource = dt;
                GridView1.DataBind();
                cnn.Close();
            }
            catch (Exception ex)
            {
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            string connetionString = null;
            SqlConnection cnn;
            connetionString = "Data Source=localhost;Initial Catalog=AdventureWorks2008R2;User ID=hr;Password=123456";
            cnn = new SqlConnection(connetionString);
            try{
                cnn.Open();
                foreach (GridViewRow gr in GridView1.Rows)
                {
                    CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                    if (cb.Checked)
                    {
                        string sql = @"delete from HumanResources.JobCandidate where FullName=N'" + Server.HtmlDecode(gr.Cells[2].Text)+"' and Email='"+gr.Cells[4].Text+"';";
                        SqlCommand command = new SqlCommand(sql, cnn);
                        //command.Connection.Open();
                        command.ExecuteNonQuery();
                    }
                }
                cnn.Close();
                bindData("JobVacancy,FullName,HiringManager,Email,ApplyDate,Status", "");
            }
            catch (Exception ex)
            {
            }
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in GridView1.Rows)
            {
                CheckBox cb = (CheckBox)gr.Cells[0].FindControl("myCheckBox");
                if (cb.Checked)
                {
                    Session["Name"] = Server.HtmlDecode(gr.Cells[2].Text);
                    Session["Email"] = Server.HtmlDecode(gr.Cells[4].Text);
                    Response.Redirect("EditCandidate.aspx",true);
                    break;
                }
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCandidate.aspx",true);
        }
    }
}
