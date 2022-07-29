<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DataTables_Assignment.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title></title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
        crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css"
        href="//cdn.datatables.net/1.10.7/css/jquery.dataTables.min.css" />
    <script src="//cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js">
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            //$('#datatable').dataTable();
            $.ajax(
                {
                    url: 'WebForm1.aspx/GetStaffInfo',
                    method: 'post',
                    dataType: 'json',
                    contentType: 'application/json',
                    async: false,
                    success: function (data) {
                        $('#datatable').dataTable({
                            data: JSON.parse(data.d),
                            columns: [
                                { 'data': 'Name' },
                                { 'data': 'ID' },
                                { 'data': 'Role' },
                            ]
                        });
                    }
                    
                });
        });
        console.log("sdasd");
    </script>
</head>
<body style="font-family: Arial">
    <form id="form1" runat="server">
        <div style="width: 500px; border: 1px solid black; padding: 5px">
            
            <table  id="datatable" >
                <thead>
                <tr>
                    <th>Name</th>
                    <th>ID</th>
                    <th>Role</th>
                </tr>
                </thead>
            </table>
            
        </div>
    </form>
</body>
</html>
