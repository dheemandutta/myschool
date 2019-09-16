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

    $('#QuestionID').val("");
    $('#QuestionText').val("");
    $('#drpTopic').val("");
    //$('#ImagePath').val("");
    $('#Marks').val("");
}

function Add() {
    var postUrl = $('#saveQuestion').val();

    var res = validate();
    if (res === false) {
        return false;
    }

    //alert($('#TopicName').val());

    var question = {
        Id: $('#QuestionID').val(),
        QuestionText: $('#QuestionText').val(),
        TopicId: $('#drpTopic').val(),
        //ImagePath: $('#ImagePath').val(),
        Marks: $('#Marks').val()
    };

    console.log(question);

    $.ajax({
        url: postUrl,
        data: JSON.stringify({ questionEntities: question }),
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
    if ($.fn.dataTable.isDataTable('#QuestionTable')) {
        table = $('#QuestionTable').DataTable();
        table.destroy();
    }

    $("#QuestionTable").DataTable({
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
                "data": "QuestionText", "name": "QuestionText", "autoWidth": true
            },
            {
                "data": "TopicName", "name": "TopicId", "autoWidth": true
            },
            //{
            //    "data": "ImagePath", "name": "ImagePath", "autoWidth": true
            //},
            {
                "data": "Marks", "name": "Marks", "autoWidth": true
            },
            {
                "data": "Id", "width": "50px", "render": function (data) {
                    return '<a href="#" onclick="GetQuestionByID(' + data + ')"><i class="fa fa-edit"></i></a>';
                }
            },
            {
                "data": "Id", "width": "50px", "render": function (d) {
                    return '<a href="#" onclick="Delete(' + d + ')"><i class="fa fa-trash"></i></a>';
                }
            }
        ]
    });
}

function GetQuestionByID(parID) {
    console.log(parID);

    var x = $("#getQuestionByID").val();

    $.getJSON(x, { Id: parID }, function (result) {
        console.log(result);

        $('#QuestionText').val(result.QuestionText);
        $('#drpTopic').val(result.TopicId);
        //$('#ImagePath').val(result.ImagePath);
        $('#Marks').val(result.Marks);

        $('#QuestionID').val(result.Id);
    });
    return false;
}

function Delete(Id) {
    var ans = confirm("Do you want to delete the record?");
    var deleteUrl = $('#deleteQuestion').val();
    if (ans) {
        $.ajax({
            url: deleteUrl,
            data: JSON.stringify({ ID: Id }),
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




