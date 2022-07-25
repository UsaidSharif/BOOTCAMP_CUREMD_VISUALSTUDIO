<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CarSelection.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
<script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div >
         
             <label for="input">Enter Name of Car in CarList<br />
             <br />
             </label>
            &nbsp;<input type="text" id="input"  />
        </div>


    </form>




   
<script>
        const inputCar = document.getElementById("input");
    inputCar.addEventListener("input", () =>
    {
            if (!inputCar.value) {
                BindControls([])
                return
            }
            else {
                $.ajax({
                    url: 'WebForm1.aspx/CarSuggestionList',
                    type: 'post',
                    data: JSON.stringify({ "name": $("#input").val() }),

                    contentType: 'application/json',
                    success: function (data) {
                        BindControls(data.d)
                        console.log(data.d)
                    }
                });
            }
            console.log(inputCar.value);
            console.log("Ajax ran");
    }
    )



        function BindControls(list) {

            $('#input').autocomplete({
                source: list,
                minLength: 0,
                scroll: true
            }).focus(function () {
                $(this).autocomplete("search", "");
            });
        }
</script>

</body>
</html>
