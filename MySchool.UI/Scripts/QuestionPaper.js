function GetNextQuestion(int pageindex,int pagesize) {
    var loadposturl = $('#loaddata').val();
    $.ajax({
        url: loadposturl,
        type: "GET",
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify({ pageIndex: pageindex, pageSize: pagesize }),
        dataType: "json",
        success: function (result) {
            //SetUpGrid();
            console.log(result);
            console.log(result.QuestionEntities[0].Id);
            console.log(result.QuestionEntities[0].AnswerEntities);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}