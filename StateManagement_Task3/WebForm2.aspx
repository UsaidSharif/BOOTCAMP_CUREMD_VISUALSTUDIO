<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="StateManagement_Task3.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
     integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>Greetings Page</title>
</head>
<body>
<div class="container text-center m-5 max=540px  "  >
    <img src="english-greetings.jpg" class="img-fluid w-100 height:390px" alt="...">
    
    <form id="form1" runat="server">
        <div  class="card-img-overlay font-weight-bold p-5">
            <h1>
                <%--label to store greetinf message--%>
            <asp:Label ID="Label1" runat="server" Text="Greeting Meassage will show here"></asp:Label>
            </h1>

            <br />
            <asp:Button ID="Button_LogOut" runat="server" Text="Log Out" OnClick="Button_LogOut_Click" Class="btn btn-dark font-weight-bold" />

        </div>
    </form>
</div>
</body>
</html>
