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

    $('#TopicID').val("");
    $('#TopicName').val("");
    $('#drpSubject').val("");
}

function Add() {
    var postUrl = $('#saveTopic').val();

    var res = validate();
    if (res === false) {
        return false;
    }

    //alert($('#TopicName').val());

    var topic = {
        Id: $('#TopicID').val(),
        TopicName: $('#TopicName').val(),
        SubjectId: $('#drpSubject').val()
    };

    console.log(topic);

    $.ajax({
        url: postUrl,
        data: JSON.stringify({ topicEntities: topic }),
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
    if ($.fn.dataTable.isDataTable('#TopicTable')) {
        table = $('#TopicTable').DataTable();
        table.destroy();
    }

    $("#TopicTable").DataTable({
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
                "data": "TopicName", "name": "TopicName", "autoWidth": true
            },
            {
                "data": "SubjectName", "name": "SubjectId", "autoWidth": true
            },
            {
                "data": "ID", "width": "50px", "render": function (data) {
                    return '<a href="#" onclick="GetTopicByID(' + data + ')"><i class="fa fa-edit"></i></a>';
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

function GetTopicByID(parID) {
    console.log(parID);

    var x = $("#getTopicByID").val();

    $.getJSON(x, { ID: parID }, function (result) {
        console.log(result);

        $('#TopicName').val(result.TopicName);
        $('#drpSubject').val(result.SubjectId);

        $('#TopicID').val(result.ID);
    });
    return false;
}

function Delete(ID) {
    var ans = confirm("Do you want to delete the record?");
    var deleteUrl = $('#deleteTopic').val();
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