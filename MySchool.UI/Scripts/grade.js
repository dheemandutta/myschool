﻿

function validate() {

    var myform = $('#MyForm');
    if (myform.parsley().validate()) {
        //alert('valid');
        return true;
    }
    else {
        //alert('invalid');
        return false;
    }
}

function ClearAll() {
    $('#txtGrade').val('');
    $('#drpGrade').val('');
}

function SaveOrUpdate() {
    var postUrl = $('#savegrade').val();
    var res = validate;
    if (res === false) {
        return false;
    }

    var grade = {
        ID: $('#GridID').val(),
        Grade: $('#txtGrade').val(),
        GradeGroupID: $('#drpGrade').val()
    };

    console.log(grade);

    $.ajax({
        url: postUrl,
        data: JSON.stringify({ gradeentities: grade }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result > 0) {
                ClearAll();
                SetUpGrid();
                swal("Good job!", "Data Saved Successfully", "success");
                
            }
            else {
                ClearAll();
                SetUpGrid();
                swal("Sorry!", "Data Not Saved", "error");
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function Add() {
    var postUrl = $('#savegrade').val();

    var res = validate();
    if (res === false) {
        return false;
    }

    var grade = {
        ID: $('#GridID').val(),
        Grade: $('#txtGrade').val(),
        GradeGroupID: $('#drpGrade').val()
    };

    $.post(postUrl,
        { gradeentities: grade },
        function (data, status, jqXHR) {
       
            SetUpGrid();
            ClearAll();
        }).done(function () {
            swal("Good job!", "Data Saved Successfully", "success");
        }).fail(function () {
            swal("Sorry!", "Data Not Saved", "error");
        });
}

function Delete(ID) {
    var ans = confirm("Do you want to delete the record?");
    var deleteUrl = $('#deletegrade').val();
    if (ans) {
        $.ajax({
            url: deleteUrl,
            data: JSON.stringify({ ID: ID }),
            type: "POST",
            contentType: "application/json;charser=UTF-8",
            dataType: "json",
            success: function (result) {
                debugger;
                if (result > 0) {
                    alert("Grade deleted successfully");

                    SetUpGrid();

                }
                else {
                    alert("Grade can not be deleted as this is already used.");
                }
            },
            error: function () {
                alert(errormessage.responseText);
            }
        });
    }
}


function loadData() {
    var loadposturl = $('#loadgradeallpagewise').val();
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
    var loadposturl = $('#loadgradeallpagewise').val();

    $.fn.dataTable.ext.errMode = 'none';
    if ($.fn.dataTable.isDataTable('#tblGrade')) {
        table = $('#tblGrade').DataTable();
        table.destroy();
    }
    // alert('hh');
    var mytable = $("#tblGrade").DataTable({
        "processing": true,
        "serverSide": true,
        "filter": false, 
        "orderMulti": false, 
        "bLengthChange": false, 
        "ajax": {
            "url": loadposturl,
            "type": "POST",
            "datatype": "json"
            //"data": { searchvalue: searchval }
        },
        "columns": [
            {
                "data": "GradeGroup", "name":"GradeGroup","autowidth":true
            },
            {
                "data": "Grade", "name": "Grade", "autoWidth": true
            },
            {
                "data": "ID", "width": "50px", "render": function (data) {
                    return '<a href="#" onclick="GetGradeByID(' + data + ')"><i class="fa fa-edit"></i></a>';
                }
            },
            {
                "data": "ID", "width": "50px", "render": function (d) {
                    return '<a href="#" onclick="Delete(' + d + ')"><i class="fa fa-trash"></i></a>';
                }
            }

        ]
    });
}

function GetGradeByID(ID) {
    var x = $("#getgradebyid").val();
    $.ajax({
        url: x,
        data:
        {
            ID: ID
        },
        type: "GET",
        contentType: "application/json;charset=UTF-8",
        async: "false",
        dataType: "json",
        success: function (result) {
            $('#txtGrade').val(result.Grade);
            $('#drpGrade').val(result.GradeGroupID);
            $('#GridID').val(result.ID);
            //$("#btnSave").attr('value', 'Update');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}

