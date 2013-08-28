
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.SessionState;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;

/// <summary> 
/// Upload handler for uploading files. 
/// </summary> 
public class Upload : IHttpHandler, IRequiresSessionState
{

    public Upload()
    {
    }

    #region "IHttpHandler Members"

    public bool IsReusable
    {
        get { return true; }
    }

    public void ProcessRequest(HttpContext context)
    {      
        if (context.Request.Files.Count > 0)
        {
            // get the applications path 

            string uploadPath = HttpContext.Current.Server.MapPath("~/Images/");
            for (int j = 0; j <= context.Request.Files.Count - 1; j++)
            {
                // loop through all the uploaded files 
                // get the current file 
                HttpPostedFile uploadFile = context.Request.Files[j];
                
                // if there was a file uploded 
                if (uploadFile.ContentLength > 0)
                {
                    string fileName = uploadFile.FileName.Replace(" ", "_");
                    string pathRoot = HttpContext.Current.Server.MapPath("~/Images/");
                    if (!File.Exists(pathRoot + fileName))
                    {
                        uploadFile.SaveAs(pathRoot + fileName);
                    }
                    else
                    {
                        var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                        var stringChars = new char[8];
                        var random = new Random();

                        for (int i = 0; i < stringChars.Length; i++)
                        {
                            stringChars[i] = chars[random.Next(chars.Length)];
                        }

                        var finalString = new String(stringChars);
                        uploadFile.SaveAs(pathRoot + fileName.Replace(".", finalString + "."));
                        FileInfo old = new FileInfo(pathRoot + fileName.Replace(".", finalString + "."));
                        FileInfo newFile = new FileInfo(pathRoot + fileName);
                        if (old.Length == newFile.Length)
                        {
                            File.Delete(pathRoot + fileName.Replace(".", finalString + "."));
                        }
                        else
                        {
                            fileName = fileName.Replace(".", finalString + ".");
                        }
                    }
                    if (File.Exists(HttpContext.Current.Server.MapPath("~/Images/") + "/ListImageFile.txt"))
                    {
                        String content = File.ReadAllText(HttpContext.Current.Server.MapPath("~/Images/") + "/ListImageFile.txt");
                        content = content + fileName + "|";
                        File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + "/ListImageFile.txt", content);
                    }
                    else
                    {
                        String content = fileName + "|";
                        File.WriteAllText(HttpContext.Current.Server.MapPath("~/Images/") + "/ListImageFile.txt", content);
                    }
                }
            }
        }
        // Used as a fix for a bug in mac flash player that makes the 
        // onComplete event not fire 
        HttpContext.Current.Response.Write(" ");
    }

    #endregion


}
