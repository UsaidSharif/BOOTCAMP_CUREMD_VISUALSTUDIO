<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="primaryPage.aspx.cs" Inherits="WebProject_Inventory.primaryPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
        crossorigin="anonymous">
    <title>PrimaryPage</title>
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
                            <a class="nav-link" runat="server" id="bill" href="Bill.aspx">Bills</a>
                        </li>
                        <li class="nav-item">
                            <asp:Button ID="Button_LogOut" runat="server" Text="LogOut" Class="btn btn-danger mx-3" OnClick="Button_LogOut_Click" />
                        </li>


                    </ul>
                </nav>

                <div class="d-flex justify-content-center">
                    <h1 class=" bg-secondary p-3">
                        <asp:Label runat="server" ID="Label_User" Text=""></asp:Label>
                    </h1>
                </div>

            </div>
        </form>
    </div>
</body>
</html>
