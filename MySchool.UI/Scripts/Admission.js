
function loadData() {
    var loadposturl = $('#getadmissionformpagewise').val();
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
    var loadposturl = $('#getadmissionformpagewise').val();

    $.fn.dataTable.ext.errMode = 'none';
    if ($.fn.dataTable.isDataTable('#tblStudentListForAdmission')) {
        table = $('#tblStudentListForAdmission').DataTable();
        table.destroy();
    }
    // alert('hh');
    var mytable = $("#tblStudentListForAdmission").DataTable({
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
                "data": "FormNumber", "name": "FormNumber", "autowidth": true
            },
            {
                "data": "StudentName", "name": "StudentName", "autoWidth": true
            },
            {
                "data": "FatherName", "name": "FatherName", "autoWidth": true
            },
            {
                "data": "MotherName", "name": "MotherName", "autoWidth": true
            },
            {
                "data": "ID", "width": "50px", "render": function (data) {
                    return '<input type="button" value = "Admit" onclick="GetStudentDetailsforAdmissionByID(' + data + ')">';
                }
            },
        ]
    });
}

function GetStudentDetailsforAdmissionByID(ID) {

}