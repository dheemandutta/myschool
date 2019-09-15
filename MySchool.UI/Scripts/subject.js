
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
    $('#drpGrade').val("");
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
        SubjectName: $('#SubjectName').val(),
        GradeIds: $('#drpGrade').val()
    };

    console.log(subject);
    console.log(JSON.stringify(subject));

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
    if ($.fn.dataTable.isDataTable('#SubjectTable')) {
        table = $('#SubjectTable').DataTable();
        table.destroy();
    }

    $("#SubjectTable").DataTable({
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
                "data": "SubjectName", "name": "SubjectName", "autoWidth": true
            },
            {
                "data": "Grade", "name": "GradeID", "autoWidth": true
            },
            {
                "data": "ID", "width": "50px", "render": function (data) {
                    return '<a href="#" onclick="GetSubjectByID(' + data + ')"><i class="fa fa-edit"></i></a>';
                }
            }
        ]
    });
}

function GetSubjectByID(parID) {
    console.log(parID);

    var x = $("#getSubjectByID").val();

    $.getJSON(x, { ID: parID }, function (result) {
        console.log(result);

        $('#SubjectName').val(result.SubjectName);
        $('#drpGrade').val(result.GradeID);

        $('#SubjectID').val(result.ID);
    });
    return false;
}