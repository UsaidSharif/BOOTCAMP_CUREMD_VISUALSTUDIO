<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="StateMangement_Task2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
     integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title></title>
</head>
<body>
     <div class="container  m-5 p-5 badge-primary text-white "  >
    <form id="form1" runat="server">
        <div >
            <asp:Label ID="UserName" runat="server" Text="UserName" class="font-weight-bold "></asp:Label>
&nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;
            <%--hidden fields for storing hidden values--%>
            <asp:HiddenField ID="HiddenField_UserName" runat="server" />
            <br />
            <asp:Label ID="Password" runat="server" Text="Password" class="font-weight-bold "></asp:Label>
&nbsp; &nbsp;
            <asp:TextBox ID="TextBox2" TextMode="Password" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:HiddenField ID="HiddenField_Password" runat="server" />
            <br />
            <%--different type of buttons--%>
            <asp:Button ID="Button_Submit" runat="server" Text="Submit" OnClick="Button_Submit_Click" class="btn btn-dark font-weight-bold" />
&nbsp;
            <asp:Button ID="Button_ViewState" runat="server" Text="Restore with View State" OnClick="Button_ViewState_Click" class="btn btn-dark font-weight-bold" />
&nbsp;
            <asp:Button ID="Button_HiddenFields" runat="server" Text="Restore with Hidden Fields" OnClick="Button_HiddenFields_Click" class="btn btn-dark font-weight-bold" />
        </div>
    </form>
         </div>
</body>
</html>
