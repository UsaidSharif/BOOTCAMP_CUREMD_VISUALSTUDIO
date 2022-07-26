<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="StateManagement_Task1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
     integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title></title>
</head>
<body>
    <div class=" container justify-content-center m-5 p-5 bg-dark text-white row"  >
    <form id="form1" runat="server">
        <div class="text-center">
            <%--Text box and button is created in this div--%>
            <asp:TextBox ID="TextBox1" runat="server" Height="33px"  Width="121px" class="text-center"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Height="32px" Text="Add One" Width="128px" OnClick="Button1_Click" class="btn btn-light font-weight-bold" />
            <br />

        </div>
    </form>
        </div>
</body>
</html>
