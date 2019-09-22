
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

function clearTextBox() {

    $('#SubjectID').val("");
    $('#SubjectName').val("");
    // $('#drpGrade').val("");
}

function Add() {
    var postUrl = $('#saveSubject').val();

    var res = validate();
    if (res === false) {
        return false;
    }

    //alert($('#FirstName').val());

    var subject = {
        ID: $('#SubjectID').val(),
        SubjectName: $('#SubjectName').val()
        //    GradeIds: $('#drpGrade').val()
    };
    $.ajax({
        url: postUrl,
        data: JSON.stringify({ subjectEntities: subject }),
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

function Delete(ID) {
    var ans = confirm("Do you want to delete the record?");
    var deleteUrl = $('#delete').val();
    if (ans) {
        $.ajax({
            url: deleteUrl,
            data: JSON.stringify({ ID: ID }),
            type: "POST",
            contentType: "application/json;charser=UTF-8",
            dataType: "json",
            success: function (result) {
                if (result > 0) {
                    alert("Subject deleted successfully");
                    SetUpGrid();

                }
                else {
                    alert("Subject can not be deleted as this is already used.");

                }
            },
            error: function () {
                alert(errormessage.responseText);
            }
        });
    }
}

//function GetSubjectByID(ID) {
//    alert("OK");
//    var x = $("#getSubjectByID").val();
//    $.ajax({
//        url: x,
//        data:
//        {
//            ID: ID
          
//        },
        
//        type: "GET",
//        contentType: "application/json;charset=UTF-8",
//        async: "false",
//        dataType: "json",
//        success: function (result) {
//            $('#SubjectName').val(result.SubjectName);
//            $('#SubjectID').val(result.ID);
//        },
//        error: function (errormessage) {
//            alert(errormessage.responseText);
//        }
//    });
//    alert(ID);
//    return false;
//}

function GetSubjectByID(ID) {
    var x = $("#getSubjectByID").val();
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
            $('#SubjectName').val(result.SubjectName);
            $('#SubjectID').val(result.ID);
    
            //$("#btnSave").attr('value', 'Update');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
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

    $.fn.dataTable.ext.errMode = 'none';
    if ($.fn.dataTable.isDataTable('#SubjectTable')) {
        table = $('#SubjectTable').DataTable();
        table.destroy();
    }
    // alert('hh');
    var mytable = $("#SubjectTable").DataTable({
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
                "data": "SubjectName", "name": "SubjectName", "autowidth": true
            },
            {
                "data": "ID", "width": "50px", "render": function (data) {
                    return '<a href="#" onclick="GetSubjectByID(' + data + ')"><i class="fa fa-edit"></i></a>';
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
