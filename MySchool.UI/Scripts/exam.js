

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
    $('#txtExam').val('');
}

function SaveOrUpdate() {
    var postUrl = $('#saveexam').val();
    var res = validate;
    if (res === false) {
        return false;
    }

    var exam = {
        ID: $('#ExamID').val(),
        ExamName: $('#txtExam').val()
    };

    console.log(exam);

    $.ajax({
        url: postUrl,
        data: JSON.stringify({ examentities: exam }),
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



function Delete(ID) {
    var ans = confirm("Do you want to delete the record?");
    var deleteUrl = $('#deleteexam').val();
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


function loadData() {
    var loadposturl = $('#loadexamallpagewise').val();
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
    var loadposturl = $('#loadexamallpagewise').val();

    $.fn.dataTable.ext.errMode = 'none';
    if ($.fn.dataTable.isDataTable('#tblExam')) {
        table = $('#tblExam').DataTable();
        table.destroy();
    }
    // alert('hh');
    var mytable = $("#tblExam").DataTable({
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
                "data": "ExamName", "name": "ExamName", "autoWidth": true
            },
            {
                "data": "ID", "width": "50px", "render": function (data) {
                    return '<a href="#" onclick="GetExamByID(' + data + ')"><i class="fa fa-edit"></i></a>';
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

function GetExamByID(ID) {
    var x = $("#getexambyid").val();
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
            $('#txtExam').val(result.ExamName);
            $('#ExamID').val(result.ID);
            //$("#btnSave").attr('value', 'Update');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}

