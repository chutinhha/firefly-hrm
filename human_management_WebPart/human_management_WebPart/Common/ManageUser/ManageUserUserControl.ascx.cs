using System;
using System.Data;
using System.Web;
using System.Web.UI;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;

namespace SP2010VisualWebPart.Common.ManageUser
{
    public partial class ManageUserUserControl : UserControl
    {
        private CommonFunction _com = new CommonFunction();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SPWeb web = SPControl.GetContextWeb(this.Context);
                foreach (SPRoleAssignment roleAssignment in web.RoleAssignments)
                {
                    string[] account = new string[100];
                    string[] name = new string[100];
                    string[] rank = new string[100];
                    int count = 0;
                    SPPrincipal member = roleAssignment.Member;
                    string[] userAccount = member.LoginName.Split('\\');
                    if (userAccount.Length > 1)
                    {
                        account[count] = userAccount[1];
                        count++;
                    }
                    else
                    {
                        account[count] = member.LoginName;
                        count++;
                    }
                    count = 0;
                    string[] userName = member.Name.Split('\\');
                    if (userName.Length > 1)
                    {
                        name[count] = userName[1];
                        count++;
                    }
                    else
                    {
                        name[count] = member.Name;
                        count++;
                    }
                    count = 0;
                    foreach (SPRoleDefinition role in roleAssignment.RoleDefinitionBindings)
                    {
                        if (role.Name.Contains("Full Control") || role.Name.Contains("Design"))
                        {
                            rank[count] = "Admin";
                        }
                        else
                        {
                            rank[count] = "User";
                        }
                        count++;
                        break;
                    }
                    DataTable user = _com.getData(Message.TableEmployee + " e join " + Message.TablePerson + " p on e."
                        + Message.BusinessEntityIDColumn + " = p." + Message.BusinessEntityIDColumn, "e." + Message.LoginIDColumn
                        + ",p." + Message.RankColumn + ",e." + Message.BusinessEntityIDColumn, "");
                    for (int i = 0; i < count; i++)
                    {
                        bool isAccountExist = false;
                        for (int j = 0; j < user.Rows.Count; j++)
                        {
                            if (account[i] == user.Rows[j][0].ToString())
                            {
                                isAccountExist = true;
                                if (rank[i] != user.Rows[j][1].ToString())
                                {
                                    _com.updateTable(Message.TablePerson, " " + Message.RankColumn + "='" + rank[i] + "'"
                                        + "," + Message.ModifiedDateColumn + "='" + DateTime.Now + "' where " + Message.BusinessEntityIDColumn
                                        + "='" + user.Rows[j][2].ToString() + "'");
                                    break;
                                }
                            }
                        }
                        if (isAccountExist == false && account[i] != "system" && !account[i].Contains("administrator")
                            &&!account[i].Contains("Administrator"))
                        {
                            _com.insertIntoTable(Message.TableEmployee + " (" + Message.LoginIDColumn + "," + Message.CurrentFlagColumn + ","
                                + Message.ModifiedDateColumn + ") ", "", "'" + account[i] + "','True','" + DateTime.Now + "'", false);
                            DataTable employeeTopID = _com.getTopID(Message.TableEmployee);
                            _com.insertIntoTable(Message.TablePerson + " (" + Message.BusinessEntityIDColumn + "," + Message.RankColumn
                                + "," + Message.NameColumn + "," + Message.ModifiedDateColumn + ") ", "", "'" + employeeTopID.Rows[0][0].ToString()
                                + "','" + rank[i] + "','" + name[i] + "','" + DateTime.Now + "'", false);
                        }
                    }
                }
            }
            catch (Exception ex) {
                lblError.Text = ex.Message;
				//ScriptManager.RegisterStartupScript(Page, this.GetType(), "myScript","alert('"+lblError.Text.Replace("'","\'")+"');", true);
            }
        }
    }
}
