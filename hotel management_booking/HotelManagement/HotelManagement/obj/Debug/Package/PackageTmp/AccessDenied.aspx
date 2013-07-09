<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccessDenied.aspx.cs" Inherits="HotelManagement.AccessDenied" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height:100%;margin:0px;padding:0px;">
    <form id="form1" runat="server">
    <table width="100%" cellspacing="0" cellpadding="0" style="height: 637px">
        <tr>
            <td style="width: 20%; background-image: url('Images/Access-Denied-LeftRight.jpg');">
            </td>
            <td style="width: 60%; background-color: #646464; vertical-align: top;">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <center>
                    <table width="70%" cellspacing="0" cellpadding="0" style="border-radius: 10px;">
                        <tr>
                            <td>
                                <div style="background: url('Images/Access-Denied.jpg') no-repeat;
                                    width: 100%; height: 89px; border-top-left-radius: 10px; border-top-right-radius: 10px;">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color: White; height: 200px; border-bottom-right-radius: 10px;
                                border-bottom-left-radius: 10px; vertical-align: top; text-align: center;">
                                <div style="padding: 5px;">
                                    <asp:Label ID="lblLink" runat="server" Text=""></asp:Label></div>
                            </td>
                        </tr>
                    </table>
                </center>
            </td>
            <td style="width: 20%; background-image: url('Images/Access-Denied-LeftRight.jpg');">
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
