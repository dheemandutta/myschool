
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

    $('#UserRegistrationID').val("");
    //$('#drpExam').val("");
    $('#FirstName').val("");
    $('#LastName').val("");
    $('#UserName').val("");
    $('#Password').val("");
}

function Add() {
    var postUrl = $('#saveUserRegistration').val();

    var res = validate();
    if (res === false) {
        return false;
    }

    //alert($('#FirstName').val());

    var userRegistration = {
        ID: $('#UserRegistrationID').val(),
        //ExamId: $('#drpExam').val(),
        FirstName: $('#FirstName').val(),
        LastName: $('#LastName').val(),
        UserName: $('#UserName').val(),
        Password: $('#Password').val()
    };

    console.log(userRegistration);

    $.ajax({
        url: postUrl,
        data: JSON.stringify({ userRegistrationEntities: userRegistration }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result > 0) {
                clearTextBox();
                //SetUpGrid();
                swal("Good job!", "Data Saved Successfully", "success");

            }
            else {
                clearTextBox();
                //SetUpGrid();
                swal("Sorry!", "Data Not Saved", "error");
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}