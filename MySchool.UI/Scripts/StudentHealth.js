
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

    $('#StudentHealthID').val("");

    $('#drpStudentName').val("");
    $('#BloodGroup').val("");
    $('#KnownMadicalProblems').val("");
    $('#DoctorName').val("");

    //$('input:checkbox').removeAttr('checked');
}

function Add() {
    var postUrl = $('#saveStudentHealth').val();

    var res = validate();
    if (res === false) {
        return false;
    }

    //alert($('#FirstName').val());

    var studentHealth = {
        ID: $('#StudentHealthID').val(),
        StudentID: $('#drpStudentName').val(),

        BloodGroup: $('#BloodGroup').val(),
        KnownMadicalProblems: $('#KnownMadicalProblems').val(),
        DoctorName: $('#DoctorName').val()
    };

    console.log(studentHealth);

    $.ajax({
        url: postUrl,
        data: JSON.stringify({ studentHealthEntities: studentHealth }),
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
    if ($.fn.dataTable.isDataTable('#StudentHealthTable')) {
        table = $('#StudentHealthTable').DataTable();
        table.destroy();
    }

    $("#StudentHealthTable").DataTable({
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
                "data": "BloodGroup", "name": "BloodGroup", "autoWidth": true
            },
            {
                "data": "KnownMadicalProblems", "name": "KnownMadicalProblems", "autoWidth": true
            },
            {
                "data": "DoctorName", "name": "DoctorName", "autoWidth": true
            },
            {
                "data": "ID", "width": "50px", "render": function (data) {
                    return '<a href="#" onclick="GetStudentHealthByID(' + data + ')"><i class="fa fa-edit"></i></a>';
                }
            }
        ]
    });
}

function GetStudentHealthByID(contID) {
    console.log(contID);

    var x = $("#getStudentHealthByID").val();

    $.getJSON(x, { ID: contID }, function (result) {
        console.log(result);

        $('#drpStudentName').val(result.StudentID);

        $('#BloodGroup').val(result.BloodGroup);
        $('#KnownMadicalProblems').val(result.KnownMadicalProblems);
        $('#DoctorName').val(result.DoctorName);

        $('#StudentHealthID').val(result.ID);

    });
    return false;
}