<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="GridView_task1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
     integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title></title>

</head>
<body>
    <div class="container d-inline-flex justify-content-center m-5">
    <form id="form1" runat="server">
        <div >
            <%--gridview--%>
            <asp:GridView ID="GridView1" runat="server" class="table text-center table-hover table-striped  table-bordered "   >
            </asp:GridView>

        </div>
    </form>
    </div>
</body>
</html>