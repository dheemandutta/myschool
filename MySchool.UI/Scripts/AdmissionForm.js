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
    if ($.fn.dataTable.isDataTable('#AdmissionListTable')) {
        table = $('#AdmissionListTable').DataTable();
        table.destroy();
    }

    $("#AdmissionListTable").DataTable({
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
                "data": "FormNumber", "name": "FormNumber", "autoWidth": true
            },
            {
                "data": "StudentName", "name": "StudentName", "autoWidth": true
            },
            {
                "data": "DOB1", "name": "DOB", "autoWidth": true
            },
            {
                "data": "Address", "name": "Address", "autoWidth": true
            },
            {
                "data": "IdentificationMarks", "name": "IdentificationMarks", "autoWidth": true
            }
            //,{
            //    "data": "ID", "width": "50px", "render": function (data) {
            //        return '<a href="#" onclick="GetTopicByID(' + data + ')"><i class="fa fa-edit"></i></a>';
            //    }
            //},
            //{
            //    "data": "ID", "width": "50px", "render": function (d) {
            //        return '<a href="#" onclick="Delete(' + d + ')"><i class="fa fa-trash"></i></a>';
            //    }
            //}
        ]
    });
}