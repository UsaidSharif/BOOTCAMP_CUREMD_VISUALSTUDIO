$(document).ready(function () {

    $.ajax({
        url: 'Items.aspx/GetCustomers',
        method: 'post',
        dataType: 'json',
        contentType: 'application/json',
        async: false,
        success: function (data) {

            $('#myTable').dataTable({
                data: JSON.parse(data.d),
                columns: [
                    { 'data': 'ID' },
                    { 'data': 'ItemName' },
                    { 'data': 'CostPrice' },
                    { 'data': 'SalePrice' },
                    {
                        'data': 'ID', 'render':
                            function (data) {
                                return '<button type="button" class="btn btn-secondary m-2" id="editAccountantID" onclick="editCustomer(' + data + ')">Edit</button> <button type="button" class="btn btn-secondary" id="deleteItem" onclick="clearCustomer(' + data + ')">Delete</i></button>'
                            }
                    }

                ]
            });
        }

    });
});
var id;
function editCustomer(ID) {

    $("#showDiv_edit").fadeIn();
    id = ID;
}
function EditCustomer() {
    var CostPrice = document.getElementById("TextBox_Name").value;
    var SalePrice = document.getElementById("TextBox_Address").value;
    if (CostPrice == "" || SalePrice == "") {
        alert("Input is Empty");
        return false;
    }
    else {
        $.ajax({
        url: 'Items.aspx/EditCustomers',
        method: 'post',
        dataType: 'json',
        data: JSON.stringify({ "id": id, "CostPrice": CostPrice, "SalePrice": SalePrice }),
        contentType: 'application/json',
        async: false,
        success: function (data) {
            var table = $('#myTable').DataTable();
            table.destroy();
            $('#myTable').dataTable({
                data: JSON.parse(data.d),
                columns: [
                    { 'data': 'ID' },
                    { 'data': 'ItemName' },
                    { 'data': 'CostPrice' },
                    { 'data': 'SalePrice' },
                    {
                        'data': 'ID', 'render':
                            function (data) {
                                return '<button type="button" class="btn btn-secondary m-2" id="editAccountantID" onclick="editCustomer(' + data + ')">Edit</button> <button type="button" class="btn btn-secondary" id="deleteItem" onclick="clearCustomer(' + data + ')">Delete</i></button>'
                            }
                    }
                ]
            });
        }

    });

    }
    
}

function edit_hidediv() {
    $("#showDiv_edit").fadeOut();
}

function addCustomer_showdiv() {

    $("#showDiv_add").fadeIn();

}
function addCustomer_hidediv() {

    $("#showDiv_add").fadeOut();

}
function addCustomer() {

   
    var ID = document.getElementById("newID").value;
    var ItemName = document.getElementById("newName").value;
    var CostPrice = document.getElementById("newAddress").value;
    var SalePrice = document.getElementById("SalePrice").value;
    if (CostPrice == "" || SalePrice == "" || ID == "" || ItemName=="" ) {
        alert("Input is Empty");
        return false;
    }
    else {
        $.ajax({
            url: 'Items.aspx/AddCustomer',
            method: 'post',
            dataType: 'json',
            data: JSON.stringify({ "id": ID, "ItemName": ItemName, "CostPrice": CostPrice, "SalePrice": SalePrice }),
            contentType: 'application/json',
            async: false,
            success: function (data) {
                var table = $('#myTable').DataTable();
                table.destroy();
                $('#myTable').dataTable({
                    data: JSON.parse(data.d),
                    columns: [
                        { 'data': 'ID' },
                        { 'data': 'ItemName' },
                        { 'data': 'CostPrice' },
                        { 'data': 'SalePrice' },
                        {
                            'data': 'ID', 'render':
                                function (data) {
                                    return '<button type="button" class="btn btn-secondary m-2" id="editAccountantID" onclick="editCustomer(' + data + ')">Edit</button> <button type="button" class="btn btn-secondary" id="deleteItem" onclick="clearCustomer(' + data + ')">Delete</i></button>'
                                }
                        }
                    ]
                });

                $("#status").html("Customer Added!")
            }

        });
    }
   
}

function clearCustomer(ID) {
    $.ajax({
        url: 'Items.aspx/ClearCustomer',
        type: 'post',
        data: JSON.stringify({ "id": ID }),
        contentType: 'application/json',
        async: false,
        success: function (data) {
            debugger
            var table = $('#myTable').DataTable();
            table.destroy();
            $('#myTable').dataTable({
                data: JSON.parse(data.d),
                columns: [
                    { 'data': 'ID' },
                    { 'data': 'ItemName' },
                    { 'data': 'CostPrice' },
                    { 'data': 'SalePrice' },
                    {
                        'data': 'ID', 'render':
                            function (data) {
                                return '<button type="button" class="btn btn-secondary m-2" id="editAccountantID" onclick="editCustomer(' + data + ')">Edit</button> <button type="button" class="btn btn-secondary" id="deleteItem" onclick="clearCustomer(' + data + ')">Delete</i></button>'
                            }
                    }
                ]
            });


        }

    });

}