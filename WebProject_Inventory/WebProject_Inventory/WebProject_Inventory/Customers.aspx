<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="WebProject_Inventory.Customers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
        crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css"
        href="//cdn.datatables.net/1.10.7/css/jquery.dataTables.min.css" />
    <script src="//cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js">
    </script>
    <script type="text/javascript" src="Customer_JS.js"></script>
    <title>Customers</title>
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
                            <asp:Button ID="Button_LogOut" runat="server" Text="LogOut" Class="btn btn-danger mx-3" OnClick="Button_LogOut_Click"  />
                        </li>


                    </ul>
                </nav>
               </div>

            <div class="text-center pt-5 font-weight-bold ">
                <br />
                <button  type="button"  onclick="addCustomer_showdiv()"  class="btn btn-secondary m-1 px-3">ADD Customer</button>
               
            </div>

            <div id="showDiv_edit" style="display:none" class="text-center pt-5 font-weight-bold bg-light">
                <br />
                <asp:Label ID="Label_Name" runat="server" Text="Name"></asp:Label>
&nbsp;
                <asp:TextBox ID="TextBox_Name" runat="server"></asp:TextBox>
&nbsp;
                <asp:Label ID="Label_Address" runat="server" Text="Address"></asp:Label>
&nbsp;
                <asp:TextBox ID="TextBox_Address" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <button type="button"   onclick="EditCustomer()"  class="btn btn-secondary m-1 px-3">UPDATE</button>
                &nbsp;&nbsp;&nbsp;
                <button type="button"   onclick="edit_hidediv()"  class="btn btn-secondary m-1 px-3">CANCEL</button>
                <br />
                <br />
            </div>
            
            <div id="showDiv_add" style="display:none" class="text-center pt-5 font-weight-bold bg-light">
                <br />

                <asp:Label ID="LabelID" runat="server" Text="Customer ID"></asp:Label>

                <asp:TextBox ID="newID" Type="number" runat="server"></asp:TextBox>

                <asp:Label ID="LabelName" runat="server" Text="Customer Name"></asp:Label>
&nbsp;
                <asp:TextBox ID="newName" Type="text" runat="server"></asp:TextBox>
&nbsp;
                <asp:Label ID="LabelAddress" runat="server" Text="Customer Address"></asp:Label>
&nbsp;
                <asp:TextBox ID="newAddress" Type="text" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <br />
                <br />
                 <button id="Button_add" type="button"  onclick="addCustomer()"  class="btn btn-secondary m-1 px-3">ADD</button>
                &nbsp;&nbsp;&nbsp;
                
                <button id="Button_cancel" type="button"   onclick="addCustomer_hidediv()"  class="btn btn-secondary m-1 px-3">CANCEL</button>
                <br />
                <asp:Label ID="status" runat="server"  Text=""></asp:Label>
            </div>

            <div class="m-5 bg-secondary p-3 font-weight-bold ">
                <table id="myTable">
                <thead>
                    <tr id="tRow">
                        <th>ID</th>
                        <th>Name</th>
                        <th>Address</th>
                        <th>Edit</th>
                    </tr>
                </thead>
               <tbody></tbody>
            </table>
            </div>
                
                

        </form>
    </div>
</body>
</html>
