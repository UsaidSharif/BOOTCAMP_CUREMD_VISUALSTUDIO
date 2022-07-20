<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Calculator Result</title>
</head>

<body>
    <form id="form1" runat="server">
        <div>

            <asp:TextBox ID="NumberX" runat="server" Height="32px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Operation" runat="server" Width="166px" Height="32px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="NumberY" runat="server" Height="30px"></asp:TextBox>
&nbsp;&nbsp;
            &nbsp;&nbsp;
            <asp:TextBox ID="Equalsto" runat="server" Height="31px"></asp:TextBox>

&nbsp;<asp:TextBox ID="Resultt" runat="server" Height="29px"></asp:TextBox>

        </div>
        
    </form>
</body>

</html>
