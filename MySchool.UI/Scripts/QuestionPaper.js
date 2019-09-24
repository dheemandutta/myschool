function GetNextQuestion( pageindex, pagesize) {
    var loadposturl = $('#loaddata').val();
    console.log('hi');
    console.log(pageindex);
    console.log(pagesize);
    //$.ajax({
    //    url: loadposturl,
    //    type: "GET",
    //    contentType: "application/json;charset=utf-8",
    //    data: JSON.stringify({ pageindex: pageindex, pagesize: pagesize }),
    //    dataType: "json",
    //    success: function (result) {
    //        //SetUpGrid();
    //        console.log(result);
    //        console.log(result.QuestionEntities[0].Id);
    //        console.log(result.QuestionEntities[0].AnswerEntities);
    //    },
    //    error: function (errormessage) {
    //        alert(errormessage.responseText);
    //    }
    //});

    $.getJSON(loadposturl, { pageindex: pageindex, pagesize: pagesize}, function (result) {

            console.log(result);
            console.log(result.QuestionEntities[0].Id);
            console.log(result.QuestionEntities[0].AnswerEntities);
    });
    return false;
}