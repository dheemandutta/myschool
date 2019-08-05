//import { fstat } from "fs";

function validate() {
    var isValid = true;
    if ($('#txtGrade').val().trim() == "") {
        isValid = false;
    }
    //if ($('#drpGrade').val().trim() == "" || $('#drpGrade').val("Select")) {

    else if ($('#drpGrade').val().trim() == "") {
        isValid = false;
    }
    else {
        isValid = true;
    }
    return isValid;
}

function ClearAll() {
    $('#txtGrade').val('');
    $('#drpGarde').val('');
    //$('#btnSave').val('Save');
}

function SaveOrUpdate() {
    var postUrl = $('#savegrade').val();
    var res = validate;
    if (res == false) {
        return false;
    }

    var grade = {
        Grade: $('#txtGrade').val(),
        GradeGroupID: $('#drpGrade').val(),
    };

    $.ajax({
        url: postUrl,
        data: JSON.stringify(grade),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result > 0) {
                alert("Data saved successfully");
               
    //          SetUpGrid();
            }
            else {
                alert("Data not saved");
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}