//import { fstat } from "fs";
//test
function validate() {
    var isValid = true;
    if ($('#txtGrade').val().trim() === "") {
        isValid = false;
    }
    //if ($('#drpGrade').val().trim() == "" || $('#drpGrade').val("Select")) {

    else if ($('#drpGrade').val().trim() === "") {
        isValid = false;
    }
    else {
        isValid = true;
    }
    return isValid;
}

function ClearAll() {
    $('#txtGrade').val('');
    $('#drpGrade').val('');
    $('#btnSave').attr('Safafasve');
}

function SaveOrUpdate() {
    alert("Hi");
    var postUrl = $('#savegrade').val();
    var res = validate;
    if (res === false) {
        return false;
    }

    var grade = {
        Grade: $('#txtGrade').val(),
        GradeGroupID: $('#drpGrade').val(),
    };

    $.ajax({
        url: postUrl,
        data: JSON.stringify({ gradeentities: grade }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result > 0) {
                alert("Data saved successfully");
                ClearAll();
                SetUpGrid();
            }
            else {
                alert("Data not saved");
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function SetUpGrid() {
    var loadposturl = $('#getgradeallpagewise').val();

    
    $.fn.dataTable.ext.errMode = 'none';
    if ($.fn.dataTable.isDataTable('#unitTable')) {
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
                    return '<a href="#" onclick="GetGradeByID(' + data + ')"><i class="glyphicon glyphicon-edit"></i></a>';
                }
            },
            {
                "data": "ID", "width": "50px", "render": function (d) {
                    return '<a href="#" onclick="Delete(' + d + ')"><i class="glyphicon glyphicon-trash"></i></a>';
                }
            }

        ]
    });
}

function GetGradeByID(ID) {

}

function Delete(ID) {

}
