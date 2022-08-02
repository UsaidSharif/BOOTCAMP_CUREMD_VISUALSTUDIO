<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Accountants.aspx.cs" Inherits="WebProject_Inventory.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
        crossorigin="anonymous">
    <title>Accountants</title>
    <style>
        .navbar-nav {
            margin-left: auto;
        }

        .nav_text {
            color: crimson;
            padding-left: 2%;
        }
    </style>
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">
            <div>
                <nav class="navbar navbar-expand-sm bg-dark ml-auto ">

                    <h3 class="nav_text">Inventory System</h3>

                    <ul class="navbar-nav ">
                        <li class="nav-item ">
                            <a class="nav-link  " href="primaryPage.aspx">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Customers.aspx">Customers</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Items.aspx">Items</a>

                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="accountants" runat="server" href="Accountants.aspx">Accountants</a>
                        </li>
                       
                        <li class="nav-item">
                            <asp:Button ID="Button_LogOut" runat="server" Text="LogOut" Class="btn btn-danger mx-3" OnClick="Button_LogOut_Click" />
                        </li>


                    </ul>
                </nav>

                

            </div>
            <div class="row justify-content-center m-5">

                
                <div class="m-3 p-5 w-50 text-center font-weight-bolder bg-secondary  " style="border-radius: 50px">

                    <h1>Accountant Signup</h1>
                    <p>&nbsp;</p>


                    <asp:Label ID="Label_username" runat="server" Text="UserName"></asp:Label>
                    &nbsp;
            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label_password" runat="server" Text="Password"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Password" TextMode="Password" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="Button_Add" Class="btn btn-dark" runat="server" Text="ADD" OnClick="Button_Add_Click"  />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button_Delete" Class="btn btn-dark" runat="server" Text="DELETE" OnClick="Button_Delete_Click"  />
                    <br />
                    <br />
                    <asp:Label ID="Label_Status" runat="server" Text=""></asp:Label>
                    <br />
                    <br />
                    
                </div>
            </div>

        </form>
    </div>
</body>
</html>
