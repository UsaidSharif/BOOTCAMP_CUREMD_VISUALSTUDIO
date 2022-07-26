<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="StateManagement_Task3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
     integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>LogIn Page</title>
</head>
<body>

    <div class="container text-center m-5 bg-dark text-white row"  >
        <div class="col-sm-4">
    <form id="form1" runat="server" >
        
            <div class="p-5" >
            <asp:Label ID="Label1" runat="server" Text="UserName" class="font-weight-bold"></asp:Label>
&nbsp;
            <asp:TextBox ID="TextBox_UserName"  runat="server"></asp:TextBox>
            <br />
            <br />
          
           

            <asp:Label ID="Label2" runat="server" Text="Password" class="font-weight-bold"></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="TextBox_Password" TextMode="Password" runat="server"></asp:TextBox>
            <br />
            <br />
            
            <asp:Button ID="Button_LogIn" runat="server" Text="Log In" OnClick="Button_LogIn_Click" class="btn btn-dark font-weight-bold" />

            <br />
            <br />
           
           <%--message is a  label to store the messages that come after you put wrong passwords--%> 
            <asp:Label ID="message" runat="server" Text="Welcome To CureMD BootCamp" class="font-weight-bold"></asp:Label>
            </div>
        
    </form>
      </div>
        <div class="col-sm-8">
            <img src="login-security.png" class="rounded" alt="Cinque Terre" >
        </div>
        </div>

</body>
</html>
