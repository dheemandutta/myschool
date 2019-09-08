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
    if ($.fn.dataTable.isDataTable('#StudentSearchTable')) {
        table = $('#StudentSearchTable').DataTable();
        table.destroy();
    }

    $("#StudentSearchTable").DataTable({
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
                "data": "Grade", "name": "Grade", "autoWidth": true
            },
            {
                "data": "Gender", "name": "Gender", "autoWidth": true
            }
            //,{
            //    "render": function (data, type, JsonResultRow, meta) {
            //        return '<img src="' + JsonResultRow.Photo + '"width="50" height="50"  alt="Image" class="img-responsive img-circle"  >';
            //    }
            //},
            //{
            //    "data": "ID", "width": "50px", "render": function (data) {
            //        return '<a href="#" onclick="GetStudentParticularsByID(' + data + ')"><i class="fa fa-edit"></i></a>';
            //    }
            //}
        ]
    });
}