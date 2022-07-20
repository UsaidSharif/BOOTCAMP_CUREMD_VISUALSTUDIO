<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebForm2.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calculator</title>
        <script src="JavaScript.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        
        <asp:Label ID="Number_X" runat="server" Text="Number_X "></asp:Label>
            &nbsp;&nbsp;
        <asp:TextBox ID="TextBox_Number_X" onkeypress="return isNumber(event)" runat="server" Height="16px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Number_Y" runat="server" Text="Number_Y"></asp:Label>
            &nbsp;&nbsp;
        <asp:TextBox ID="TextBox_Number_Y" onkeypress="return isNumber(event)" runat="server" Height="16px"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Width="195px" autopostback="true">
                <asp:listitem text="ADD"      Value="Addition"></asp:listitem>
                <asp:listitem text="SUBTRACT" Value="Subtraction"></asp:listitem>
                <asp:listitem text="MULTIPLY"   Value="Multiplication"></asp:listitem>
                <asp:listitem text="DIVIDE" Value="Division"></asp:listitem>
            </asp:DropDownList>

            <br />
            <br />
            <asp:Button ID="Calculate" OnClick="Calculate_Click" runat="server" Text="Calculate" Height="40px" Width="194px" />

            <br />
            <br />
            

            <br />
            <%--<asp:TextBox ID="Result" runat="server" Height="32px" Width="183px"></asp:TextBox>--%>
            
        </div>
    </form>
</body>
</html>
