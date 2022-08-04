 
    
    





$(document).ready(function () {

    $.ajax({
        url: 'Customers.aspx/GetCustomers',
        method: 'post',
        dataType: 'json',
        contentType: 'application/json',
        async: false,
        success: function (data) {

            $('#myTable').dataTable({
                data: JSON.parse(data.d),
                columns: [
                    { 'data': 'ID' },
                    { 'data': 'Name' },
                    { 'data': 'Address' },
                    {
                        'data': 'ID', 'render':
                            function (data) {
                                return '<button type="button" class="btn btn-secondary m-1" id="editAccountantID" onclick="editCustomer(' + data + ')">Edit</button> <button type="button" class="btn btn-secondary" id="deleteItem" onclick="clearCustomer(' + data + ')">Delete</i></button>'
                            }
                    }

                ]
            });
        }

    });
});
var ID;
function editCustomer(id) {

    $("#showDiv_edit").fadeIn();
    ID = id;
}
function EditCustomer() {
    var name = document.getElementById("TextBox_Name").value;
    var address = document.getElementById("TextBox_Address").value;
    if (name == "" || address == "") {
        alert("Input is Empty");
        return false;
    }
    else {
        $.ajax({
            url: 'Customers.aspx/EditCustomers',
            method: 'post',
            dataType: 'json',
            data: JSON.stringify({ "id": ID, "name": name, "address": address }),
            contentType: 'application/json',
            async: false,
            success: function (data) {
                var table = $('#myTable').DataTable();
                table.destroy();
                $('#myTable').dataTable({
                    data: JSON.parse(data.d),
                    columns: [
                        { 'data': 'ID' },
                        { 'data': 'Name' },
                        { 'data': 'Address' },
                        {
                            'data': 'ID', 'render':
                                function (data) {
                                    return '<button type="button" class="btn btn-secondary m-1" id="editAccountantID" onclick="editCustomer(' + data + ')">Edit</button> <button type="button" class="btn btn-secondary" id="deleteItem" onclick="clearCustomer(' + data + ')">Delete</i></button>'
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
    var name = document.getElementById("newName").value;
    var address = document.getElementById("newAddress").value;
    if (ID == "" || name == "" || address == "")
    {
        alert("Input is Empty");
        return false;
    }
    else {
        $.ajax({
            url: 'Customers.aspx/AddCustomer',
            method: 'post',
            dataType: 'json',
            data: JSON.stringify({ "id": ID, "name": name, "address": address }),
            contentType: 'application/json',
            async: false,
            success: function (data) {
                var table = $('#myTable').DataTable();
                table.destroy();
                $('#myTable').dataTable({
                    data: JSON.parse(data.d),
                    columns: [
                        { 'data': 'ID' },
                        { 'data': 'Name' },
                        { 'data': 'Address' },
                        {
                            'data': 'ID',
                            'data': 'ID', 'render':
                                function (data) {
                                    return '<button type="button" class="btn btn-secondary m-1" id="editAccountantID" onclick="editCustomer(' + data + ')">Edit</button> <button type="button" class="btn btn-secondary" id="deleteItem" onclick="clearCustomer(' + data + ')">Delete</i></button>'
                                }
                        }
                    ]
                });

                $("#status").html("Customer Added!")
            }

        });
    }

}

function clearCustomer(id) {
    $.ajax({
        url: 'Customers.aspx/ClearCustomer',
        type: 'post',
        data: JSON.stringify({ "id": id }),
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
                    { 'data': 'Name' },
                    { 'data': 'Address' },
                    {
                        'data': 'ID', 'render':
                            function (data) {
                                return '<button type="button" class="btn btn-secondary m-1" id="editAccountantID" onclick="editCustomer(' + data + ')">Edit</button> <button type="button" class="btn btn-secondary" id="deleteItem" onclick="clearCustomer(' + data + ')">Delete</i></button>'
                            }
                    }
                ]
            });


        }

    });

}