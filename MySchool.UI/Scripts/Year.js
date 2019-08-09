
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

    $('#ID').val("");
    $('#Year').val("");
    $('#YearDesc').val("");

    //$('#drpYear').val("");

    //$('#drpCompanyMaster').val("");

    //$('input:checkbox').removeAttr('checked');
}

function Add() {
    var postUrl = $('#saveYear').val();

    var res = validate();
    if (res === false) {
        return false;
    }

    //alert($('#drpCompanyMaster').val());

    var years = {
        ID: $('#YearID').val(),
        Year: $('#Year').val(),
        YearDesc: $('#YearDesc').val()
    };

    $.post(postUrl,
        { years },
        function (data, status, jqXHR) {
            //alert('Data Saved Successfully');
            loadData();
            clearTextBox();

            //$.getJSON(postUrl1, function (data) {
            //    $.each(data, function (key, entry) {
            //        //alert(entry.CompanyName);
            //        console.log(entry);
            //        //$('#drpCompanyMaster').append($('<option></option>').attr('value', entry.CompanyId).text(entry.CompanyName));
            //    });
            //});

        }).done(function () {
            swal("Good job!", "Data Saved Successfully", "success");
        }).fail(function () {
            swal("Sorry!", "Data Not Saved", "error");
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
    if ($.fn.dataTable.isDataTable('#YearTable')) {
        table = $('#YearTable').DataTable();
        table.destroy();
    }

    $("#YearTable").DataTable({
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
                "data": "Year", "name": "Year", "autoWidth": true
            },
            {
                "data": "YearDesc", "name": "YearDesc", "autoWidth": true
            }
            //,
            //{
            //    "data": "CompanyId", "width": "50px", "render": function (data) {
            //        return '<a href="#" onclick="GetCompanyDetailsById(' + data + ')"><i class="glyphicon glyphicon-edit"></i></a>';
            //    }
            //},
            //{
            //    "data": "CompanyId", "width": "50px", "render": function (d) {
            //        return '<a href="#" onclick="Delete(' + d + ')"><i class="glyphicon glyphicon-trash"></i></a>';
            //    }
            //}

        ]
        //"rowId": "ID"//,
        // "dom": "Bfrtip"
    });
}