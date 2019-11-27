//import { Function } from "core-js";


function SaveOrUpdate() {
    var postUrl = $('#saveupdate').val();
    var res = validate;
    if (res === false) {
        return false;
    }


    var table = $("#tblQualification tbody");
    var myArray = [];

    table.find('tr').each(function (i) {
        var myTableData = {};
        var $tds = $(this).find('td');
        myTableData.QualName = $tds.eq(0).text();
        myTableData.QualStatus = $tds.eq(1).text();
        myTableData.QualCertPath = $tds.eq(2).text();
        myTableData.QualCompletionDate = $tds.eq(3).text();
        myArray.push(myTableData);
        alert(JSON.stringify(myArray));
    });

    var teacher = {
        ID: $('#GridID').val(),
        Grade: $('#txtGrade').val(),
        GradeGroupID: $('#drpGrade').val()
    };

    console.log(grade);

    $.ajax({
        url: postUrl,
        data: JSON.stringify({ gradeentities: grade }),
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


   