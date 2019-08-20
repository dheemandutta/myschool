function validate() {
    var myForm = $('#MyForm');
    if (myForm.parsley().validate()) {
        return true;
    }
    else {
        return false;
    }
}

function ClearAll() {
    $('#drpSection').val('');
    $('#txtSection').val('');
}

function SaveOrUpdate() {
    var postUrl = $('#savesection').val();
    var res = validate;
    if (res === false) {
        return false;
    }

    var section = {
        ID: $('#SectionID').val(),
        GradeId: $('#drpGrade').val(),
        Section: $('#txtSection').val()
    };

    console.log(section);

    $.ajax({
        url: postUrl,
        data: JSON.stringify({ sectionentities: section }),
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
    var deleteUrl = $('#deletesection').val();
    if (ans) {
        $.ajax({
            url: deleteUrl,
            data: JSON.stringify({ ID: ID }),
            type: "POST",
            contentType: "application/json;charser=UTF-8",
            dataType: "json",
            success: function (result) {
                if (result > 0) {
                    alert("Section deleted successfully");

                    SetUpGrid();

                }
                else {
                    alert("Section can not be deleted as this is already used.");
                }
            },
            error: function () {
                alert(errormessage.responseText);
            }
        });
    }
}

function loadData() {
    var loadposturl = $('#loadsectionallpagewise').val();
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
    var loadposturl = $('#loadsectionallpagewise').val();

    $.fn.dataTable.ext.errMode = 'none';
    if ($.fn.dataTable.isDataTable('#tblSection')) {
        table = $('#tblSection').DataTable();
        table.destroy();
    }
    // alert('hh');
    var mytable = $("#tblSection").DataTable({
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
                "data": "Grade", "name": "Grade", "autowidth": true
            },
            {
                "data": "Section", "name": "Section", "autoWidth": true
            },
            {
                "data": "ID", "width": "50px", "render": function (data) {
                    return '<a href="#" onclick="GetSectionByID(' + data + ')"><i class="fa fa-edit"></i></a>';
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

function GetSectionByID(ID) {
    var x = $("#getsectionbyid").val();
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
            $('#txtSection').val(result.Section);
            $('#drpGrade').val(result.GradeId);
            $('#SectionID').val(result.ID);
            //$("#btnSave").attr('value', 'Update');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}

