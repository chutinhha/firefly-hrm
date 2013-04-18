using System;
using System.Data;
using System.Web.UI;using System.Web;

namespace SP2010VisualWebPart.User.Performance.SupervisorJudgment
{
    public partial class SupervisorJudgmentUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"] == null)
            {
                Session["CurrentPage"] = HttpContext.Current.Request.Url.AbsoluteUri;Response.Redirect(Message.AccessDeniedPage);
            }
            else
            {
                if (Session["Account"].ToString() == "User")
                {
                    try
                    {
                        if (!IsPostBack)
                        {
                            lblError.Text = "";
                        }
                        int quarter = _com.getQuarter();
                        DataTable checkExist = _com.getData(Message.TableEvaluatePoint, "*", " where "
                            + Message.BusinessEntityIDColumn + "='" + Session["AccountID"].ToString() + "' and "
                            + Message.QuarterColumn + "='" + quarter + "'");
                        if (checkExist.Rows.Count > 0)
                        {
                            lblDetail.Text = "You got total "+checkExist.Rows[0][6].ToString()+" point in checkpoint quarter "+quarter
                                + "<br /><br />&nbsp;Average Point is " + checkExist.Rows[0][5].ToString()
                                +"<br /><br />&nbsp;Detail:";
                            _com.generateControl(pnlGenerate, "true", Session["AccountID"].ToString(), quarter);
                        }
                        else {
                            pnlGenerate.Visible = false;
                            lblError.Text = Message.NotHaveCheckPointYet;
							//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message+"<br /><br />";
						//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\\'")+"');", true);
                    }
                }
                else
                {
                    Response.Redirect(Message.AdminHomePage);
                }
            }
        }
    }
}
