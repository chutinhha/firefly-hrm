﻿using System;
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
                string[] allAccount = new string[100];
                int accountCount = 0;
                DataTable user = _com.getData(Message.TableEmployee + " e join " + Message.TablePerson + " p on e."
                            + Message.BusinessEntityIDColumn + " = p." + Message.BusinessEntityIDColumn, "e." + Message.LoginIDColumn
                            + ",p." + Message.RankColumn + ",e." + Message.BusinessEntityIDColumn, "");
                foreach (SPRoleAssignment roleAssignment in web.RoleAssignments)
                {
                    string[] account = new string[100];
                    string[] name = new string[100];
                    string[] rank = new string[100];
                    int count = 0;
                    SPPrincipal member = roleAssignment.Member;
                    if (!member.ToString().Contains("system") && !member.ToString().Contains("administrator")
                            && !member.ToString().Contains("Administrator"))
                    {
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
                        allAccount[accountCount] = account[count - 1];
                        accountCount++;
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
                        for (int i = 0; i < count; i++)
                        {
                            bool isAccountExist = false;
                            for (int j = 0; j < user.Rows.Count; j++)
                            {
                                if (account[i] == user.Rows[j][0].ToString())
                                {
                                    isAccountExist = true;
                                    _com.updateTable(Message.TablePerson, " " + Message.RankColumn + "='" + rank[i] + "'"
                                        + "," + Message.ModifiedDateColumn + "='" + DateTime.Now + "' where " + Message.BusinessEntityIDColumn
                                        + "='" + user.Rows[j][2].ToString() + "'");
                                    _com.updateTable(Message.TableEmployee, " " + Message.CurrentFlagColumn + "='True' where "
                                        + Message.BusinessEntityIDColumn + "='" + user.Rows[j][2].ToString() + "'");
                                    DataTable image = _com.getData(Message.TableEmployee, Message.ImageColumn, " where "
                                        + Message.BusinessEntityIDColumn + "='" + user.Rows[j][2].ToString() + "'");
                                    if (image.Rows.Count > 0 && image.Rows[0][0].ToString() != "") { }
                                    else {
                                        _com.updateTable(Message.TableEmployee, " " + Message.ImageColumn + "='add_user.png'"
                                            + " where " + Message.BusinessEntityIDColumn + "='" + user.Rows[j][2].ToString() + "'");
                                    }
                                    break;
                                }
                            }
                            if (isAccountExist == false && account[i] != "system" && !account[i].Contains("administrator")
                                && !account[i].Contains("Administrator"))
                            {
                                _com.insertIntoTable(Message.TableEmployee + " (" + Message.LoginIDColumn + "," + Message.CurrentFlagColumn + ","
                                    + Message.ModifiedDateColumn + ","+Message.ImageColumn+") ", "", "'" + account[i] + "','True','"
                                    + DateTime.Now + "','add_user.png'", false);
                                DataTable employeeTopID = _com.getTopID(Message.TableEmployee);
                                _com.insertIntoTable(Message.TablePerson + " (" + Message.BusinessEntityIDColumn + "," + Message.RankColumn
                                    + "," + Message.NameColumn + "," + Message.ModifiedDateColumn + ") ", "", "'" + employeeTopID.Rows[0][0].ToString()
                                    + "','" + rank[i] + "','" + name[i] + "','" + DateTime.Now + "'", false);
                            }
                        }
                    }
                }
                DataTable userOnly = _com.getData(Message.TableEmployee, Message.LoginIDColumn, "");
                for (int j = 0; j < userOnly.Rows.Count; j++)
                {
                    bool isAccountDelete = false;
                    for (int i = 0; i < accountCount; i++)
                    {
                        if (allAccount[i] == userOnly.Rows[j][0].ToString())
                        {
                            break;
                        }
                        else
                        {
                            if (i == accountCount - 1)
                            {
                                isAccountDelete = true;
                            }
                        }
                    }
                    if (isAccountDelete == true)
                    {
                        _com.updateTable(Message.TableEmployee, " " + Message.CurrentFlagColumn + "='False' where "
                            + Message.LoginIDColumn + "='" + userOnly.Rows[j][0].ToString() + "'");
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