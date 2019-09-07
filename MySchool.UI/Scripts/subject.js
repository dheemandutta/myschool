function validate() {
    var myForm = $('#MyForm');
    if (myForm.parsley().validate()) {
        return true;
    }
    else {
        return false;
    }
}

function SaveOrUpdate() {
    //var eachGrades = $('#drpGrade').val().split(",");
    //$.each(eachGrades, function (i, eachGrade) {
    //    console.log(eachGrade);
    //})

    console.log($('#drpGrade').val());

    //var postUrl = $('#saveorupdatesubject').val();
    //var res = validate;
    //if (res === false) {
    //    return false;
    //}

    //var section = {
    //    ID: $('#subjectID').val(),
    //    GradeId: $('#drpGrade').val(),
    //    Section: $('#txtSubject').val()
    //};

    //$.ajax({
    //    url: postUrl,
    //    data: JSON.stringify({ sectionentities: section }),
    //    type: "POST",
    //    contentType: "application/json;charset=utf-8",
    //    dataType: "json",
    //    success: function (result) {
    //        if (result > 0) {
    //            //ClearAll();
    //            //SetUpGrid();
    //            swal("Good job!", "Data Saved Successfully", "success");

    //        }
    //        else {
    //            //ClearAll();
    //            //SetUpGrid();
    //            swal("Sorry!", "Data Not Saved", "error");
    //        }
    //    },
    //    error: function (errormessage) {
    //        alert(errormessage.responseText);
    //    }
    //});
}