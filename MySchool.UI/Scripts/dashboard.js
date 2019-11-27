function SaveOrUpdateDashBoard() {
    var postUrl = $('#SaveOrUpdateDashBoard').val();
    var res = validate;
    if (res === false) {
        return false;
    }

    var dashboard = {
        ID: $('#id').val(),
        //FormNumber
        subject: $('#txtSubject').val(),
        description: $('#txtDescription').val(),
        releaseDate: $('#txtReleaseDate').val(),
        expiryDate: $('#txtExpiryDate').val(),
        importance: $('#drpImportance').val(),
        filepath: $('#fileUpload').val(),
    };

    $.ajax({
        url: postUrl,
        data: JSON.stringify({ dashboard: dashboard }),
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