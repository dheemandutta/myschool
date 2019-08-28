
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

    $('#StudentParticularsID').val("");
    $('#FirstName').val("");
    $('#LastName').val("");
    //$('#drpStudentName').val("");
    $('#drpGrade').val("");
    //$('#drpSection').val("");            ////////////////
    $('#DOB').val("");
    $('#StartDate').val("");
    $('#EndDate').val("");
    $('#LeavingReason').val("");
    $('#Gender').val("");

    //$('#drpYear').val("");
    //$('input:checkbox').removeAttr('checked');
}

function Add() {
    var postUrl = $('#saveStudentParticulars').val();

    var res = validate();
    if (res === false) {
        return false;
    }

    //alert($('#FirstName').val());

    var studentParticulars = {
        ID: $('#StudentParticularsID').val(),
        FirstName: $('#FirstName').val(),
        LastName: $('#LastName').val(),
        //drpStudentName: $('#drpStudentName').val(),
        DOB: $('#DOB').val(),
        GradeID: $('#drpGrade').val(),
        StartDate: $('#StartDate').val(),
        EndDate: $('#EndDate').val(),
        LeavingReason: $('#LeavingReason').val(),
        Gender: $('#Gender').val()
    };

    console.log(studentParticulars);

    $.ajax({
        url: postUrl,
        data: JSON.stringify({ studentParticularsEntities: studentParticulars }),
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
    if ($.fn.dataTable.isDataTable('#StudentParticularsTable')) {
        table = $('#StudentParticularsTable').DataTable();
        table.destroy();
    }

    $("#StudentParticularsTable").DataTable({
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
                "data": "DOB", "name": "DOB", "autoWidth": true
            },
            {
                "data": "Grade", "name": "GradeID", "autoWidth": true
            },
            {
                "data": "Gender", "name": "Gender", "autoWidth": true
            },
            {
                "render": function (data, type, JsonResultRow, meta) {
                    return '<img src="' + JsonResultRow.Photo + '"width="50" height="50"  alt="Image" class="img-responsive img-circle"  >';
                }
            },
            {
                "data": "ID", "width": "50px", "render": function (data) {
                    return '<a href="#" onclick="GetStudentParticularsByID(' + data + ')"><i class="fa fa-edit"></i></a>';
                }
            }
        ]
    });
}

function GetStudentParticularsByID(ID) {
    var x = $("#getStudentParticularsByID").val();
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
            $('#FirstName').val(result.FirstName);
            $('#LastName').val(result.LastName);
            $('#DOB').val(result.DOB);
            $('#GradeID').val(result.GradeID);
            $('#StartDate').val(result.StartDate);
            $('#EndDate').val(result.EndDate);
            $('#LeavingReason').val(result.LeavingReason);
            $('#Gender').val(result.Gender);         

            $('#StudentParticularsID').val(result.ID);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}