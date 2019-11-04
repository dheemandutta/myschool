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
    if ($.fn.dataTable.isDataTable('#StudentAttendentTable')) {
        table = $('#StudentAttendentTable').DataTable();
        table.destroy();
    }

    $("#StudentAttendentTable").DataTable({
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
            }
            //,{
            //    "data": "IsPresents", "name": "IsPresents", "autoWidth": true
            //}

            ,{
                "data": "IsPresents ", "width": "50px", "render": function (data) {
                    return '<div class="checkbox c-checkbox"> <label> <input type="checkbox"/> <span class="fa fa-check"> </span> </label> </div>';
                }
            }
        ]
    });
}










function GetAllSectionByGradeIdForDrp_New(ID) {
    var x = $("#myUrlid").val();

    $.ajax({
        url: x,
        type: "POST",
        data: JSON.stringify({ 'ID': ID }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            //debugger;
            var drpSection = $('#SectionID');
            drpSection.find('option').remove();
            $.each(result, function () {
                drpSection.append('<option value=' + this.ID + '>' + this.Section + '</option>');
            });
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}