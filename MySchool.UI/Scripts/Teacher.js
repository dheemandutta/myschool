//import { Function } from "core-js";


function SaveOrUpdate() {
    var postUrl = $('#saveupdate').val();
    var res = validate;
    if (res === false) {
        return false;
    }

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


   