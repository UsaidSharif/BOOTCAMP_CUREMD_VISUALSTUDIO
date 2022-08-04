<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="WebProject_Inventory.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
        crossorigin="anonymous">
    <title>LoginPage</title>
    <script>
        function validateform(){
            var UserName = document.getElementById("UserName").value;
            var Password = document.getElementById("Password").value;
            if (UserName == "" || Password == "") {
                alert("Input is Empty");
                return false;
            }

        }
    </script>
</head>
<body>
    <div class="container ">
        <form id="form1" runat="server">
            <div class="row justify-content-center m-5">

                <asp:Label ID="WelcomeMessage" Class="display-4 bg-light font-weight-bold p-5 
                "
                    Style="border-radius: 10px" runat="server" Text="Welcome to Inventory System"></asp:Label>
                <div class="m-3 p-5 w-50 text-center font-weight-bolder bg-secondary  " style="border-radius: 50px">

                    <h1>Login Page</h1>
                    <p>&nbsp;</p>


                    <asp:Label ID="Label_username" runat="server" Text="UserName"></asp:Label>
                    &nbsp;
            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label_password"  runat="server" Text="Password"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Password" TextMode="Password" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="Button_Login" Class="btn btn-dark" runat="server" Text="Login" OnClientClick="return  validateform()" OnClick="Button_Login_Click" />
                    <br />
                    <br />
                    <asp:Label ID="Label_ErrorMessage" runat="server" Text=""></asp:Label>
                    <br />
                    <br />
                </div>
            </div>

        </form>
    </div>
</body>
</html>
