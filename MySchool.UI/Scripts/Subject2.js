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
    //$('#drpGrade').val("");
}

function Add() {
    var postUrl = $('#saveSubject2').val();

    var res = validate();
    if (res === false) {
        return false;
    }

    //alert($('#TopicName').val());

    var subject = {
        ID: $('#SubjectID').val(),
        SubjectName: $('#SubjectName').val()
    };

    console.log(subject);

    //$.post(postUrl, JSON.stringify({ subjectEntities: subject }) )
    //    .done(function () {
    //        //console.log('Complete');
    //        swal("Good job!", "Data Saved Successfully", "success");
    //    })
    //    .fail(function () {
    //        swal("Sorry!", "Data Not Saved", "error");
    //    })
    //    .always(function () {
    //        clearTextBox();
    //        SetUpGrid();
    //    });


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
            //{
            //    "data": "Grade", "name": "GradeID", "autoWidth": true
            //},
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

function GetSubjectByID(parID) {
    console.log(parID);

    var x = $("#getSubjectByID").val();

    $.getJSON(x, { ID: parID }, function (result) {
        console.log(result);

        $('#SubjectName').val(result.SubjectName);
       // $('#drpGrade').val(result.GradeID);

        $('#SubjectID').val(result.ID);
    });
    return false;
}

function Delete(ID) {
    var ans = confirm("Do you want to delete the record?");
    var deleteUrl = $('#deleteSubject').val();
    if (ans) {
        $.ajax({
            url: deleteUrl,
            data: JSON.stringify({ ID: ID }),
            type: "POST",
            contentType: "application/json;charser=UTF-8",
            dataType: "json",
            success: function (result) {

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