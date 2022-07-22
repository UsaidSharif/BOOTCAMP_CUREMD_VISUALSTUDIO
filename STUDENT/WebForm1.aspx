<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="STUDENT.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>
        function isStudentInfo() {
            var inputVal = document.getElementById("DropDownList1").value;
            $.ajax(
                {
                    url: 'WebForm1.aspx/GetStudentInfo',
                    type: 'post',
                    data: JSON.stringify({ "rollNo": inputVal }),
                    contentType: 'application/json',
                    async: true,
                    success: function (data) {
                        console.log(data.d);
                        var info = data.d;
                        document.getElementById("span1").innerHTML = info.Name;
                        document.getElementById("span2").innerHTML = info.IdNumber;
                        document.getElementById("span3").innerHTML = info.Age;
                    }
                });
            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:DropDownList ID="DropDownList1"  runat="server">
            </asp:DropDownList>
            &nbsp;&nbsp;
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClientClick="return isStudentInfo()" Text="Get Data" />
            <br />
            <br /><br />
            <span id="span1"></span>
            <span id="span2"></span>
            <span id="span3"></span>
        </div>
    </form>
     
</body>
</html>
