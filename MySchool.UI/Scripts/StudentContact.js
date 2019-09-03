
function validate() {

    var myform = $('#MyForm');
    if (myform.parsley().validate()) {
        return true;
    }
    else {
        return false;
    }
}

function clearTextBox() {

    $('#StudentContactID').val("");
    $('#drpStudentName').val("");

    $('#FatherFName').val("");
    $('#FatherLName').val("");
    $('#FatherAddress').val("");
    $('#FPh1').val("");
    $('#FPh2').val("");

    $('#MotherFName').val("");
    $('#MotherLName').val("");
    $('#MotherAddress').val("");
    $('#MPh1').val("");
    $('#MPh2').val("");

    $('#GFName').val("");
    $('#GLName').val("");
    $('#GAddress').val("");
    $('#GPh1').val("");
    $('#GPh2').val("");

    //$('input:checkbox').removeAttr('checked');
}

function Add() {
    var postUrl = $('#saveStudentContact').val();

    var res = validate();
    if (res === false) {
        return false;
    }

    //alert($('#FirstName').val());

    var studentContact = {
        ID: $('#StudentContactID').val(),
        StudentID: $('#drpStudentName').val(),

        FatherFName: $('#FatherFName').val(),
        FatherLName: $('#FatherLName').val(),
        FatherAddress: $('#FatherAddress').val(),
        FPh1: $('#FPh1').val(),
        FPh2: $('#FPh2').val(),

        MotherFName: $('#MotherFName').val(),
        MotherLName: $('#MotherLName').val(),
        MotherAddress: $('#MotherAddress').val(),
        MPh1: $('#MPh1').val(),
        MPh2: $('#MPh2').val(),

        GFName: $('#GFName').val(),
        GLName: $('#GLName').val(),
        GAddress: $('#GAddress').val(),
        GPh1: $('#GPh1').val(),
        GPh2: $('#GPh2').val()
    };

    console.log(studentContact);

    $.ajax({
        url: postUrl,
        data: JSON.stringify({ studentContactEntities: studentContact }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result > 0) {
                clearTextBox();
                SetUpGrid();
                swal("Good job!", "Data Saved Successfully", "success");

            }
            else {
                clearTextBox();
                SetUpGrid();
                swal("Sorry!", "Data Not Saved", "error");
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadData() {
    var loadposturl = $('#loaddata').val();
    $.ajax({
        url: loadposturl,
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            SetUpGrid();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function SetUpGrid() {
    var loadposturl = $('#loaddata').val();

    //do not throw error
    $.fn.dataTable.ext.errMode = 'none';
    //check if datatable is already created then destroy iy and then create it
    if ($.fn.dataTable.isDataTable('#StudentContactTable')) {
        table = $('#StudentContactTable').DataTable();
        table.destroy();
    }

    $("#StudentContactTable").DataTable({
        "processing": true, // for show progress bar
        "serverSide": true, // for process server side
        "filter": false, // this is for disable filter (search box)
        "orderMulti": false, // for disable multiple column at once
        "bLengthChange": false, //disable entries dropdown
        "ajax": {
            "url": loadposturl,
            "type": "POST",
            "datatype": "json"
        },
        "columns": [
            {
                "data": "StudentName", "name": "StudentName", "autoWidth": true
            },
            {
                "data": "GName", "name": "GName", "autoWidth": true
            },
            {
                "data": "GAddress", "name": "GAddress", "autoWidth": true
            },
            {
                "data": "GPh1", "name": "GPh1", "autoWidth": true
            },
            {
                "data": "ID", "width": "50px", "render": function (data) {
                    return '<a href="#" onclick="GetStudentContactByID(' + data + ')"><i class="fa fa-edit"></i></a>';
                }
            }
        ]
    });
}

function GetStudentContactByID(contID) {
    console.log(contID);

    var x = $("#getStudentContactByID").val();

    $.getJSON(x, { ID: contID }, function (result) {
        console.log(result);

        $('#drpStudentName').val(result.StudentID);

        $('#FatherFName').val(result.FatherFName);
        $('#FatherLName').val(result.FatherLName);
        $('#FatherAddress').val(result.FatherAddress);
        $('#FPh1').val(result.FPh1);
        $('#FPh2').val(result.FPh2);

        $('#MotherFName').val(result.MotherFName);
        $('#MotherLName').val(result.MotherLName);
        $('#MotherAddress').val(result.MotherAddress);
        $('#MPh1').val(result.MPh1);
        $('#MPh2').val(result.MPh2);

        $('#GFName').val(result.GFName);
        $('#GLName').val(result.GLName);
        $('#GAddress').val(result.GAddress);
        $('#GPh1').val(result.GPh1);
        $('#GPh2').val(result.GPh2);

        $('#StudentContactID').val(result.ID);

    });
    return false;
}