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
        $('#qCnt').val(result.QuestionCount);
        SetValues(result);
    });
    //return false;
}

function SetValues(result) {

    //set Question
    $('#QuestionText').html(result.QuestionEntities[0].QuestionText);

    //set answers
    for (i = 1; i <= result.QuestionEntities[0].AnswerEntities.length; i++) {

        switch (i) {
            case 1:
                $('#rad1').show();
                $('#ansDiv1').show();
                $('#ansDiv1').html(result.QuestionEntities[0].AnswerEntities[i-1].AnswerText);
                break;
            case 2:
                $('#rad2').show();
                $('#ansDiv2').show();
                $('#ansDiv2').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                break;
            case 3:
                $('#rad3').show();
                $('#ansDiv3').show();
                $('#ansDiv3').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                break;
            case 4:
                $('#rad4').show();
                $('#ansDiv4').show();
                $('#ansDiv4').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                break;
            case 5:
                $('#rad5').show();
                $('#ansDiv5').show();
                $('#ansDiv5').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                break;
            case 6:
                $('#rad6').show();
                $('#ansDiv6').show();
                $('#ansDiv6').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                break;
            case 7:
                $('#rad7').show();
                $('#ansDiv7').show();
                $('#ansDiv7').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                break;
            case 8:
                $('#rad8').show();
                $('#ansDiv8').show();
                $('#ansDiv8').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                break;
            case 9:
                $('#rad9').show();
                $('#ansDiv9').show();
                $('#ansDiv9').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                break;
            case 10:
                $('#rad10').show();
                $('#ansDiv10').show();
                $('#ansDiv10').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                break;
            case 11:
                $('#rad11').show();
                $('#ansDiv11').show();
                $('#ansDiv11').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                break;
            case 12:
                $('#rad12').show();
                $('#ansDiv12').show();
                $('#ansDiv12').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                break;

        }

        var startIndex = 12 - result.QuestionEntities[0].AnswerEntities.length;
        for (j = result.QuestionEntities[0].AnswerEntities.length + 1; j < (startIndex + result.QuestionEntities[0].AnswerEntities.length); j++) {

            switch (j) {
                case 1:
                    $('#rad1').hide();
                    $('#ansDiv1').hide();
                    //$('#ansDiv1').html(result.QuestionEntities[0].AnswerEntities[i].AnswerText);
                    break;
                case 2:
                    $('#rad2').hide();
                    $('#ansDiv2').hide();
                    //$('#ansDiv2').html(result.QuestionEntities[0].AnswerEntities[i].AnswerText);
                    break;
                case 3:
                    $('#rad3').hide();
                    $('#ansDiv3').hide();
                    //$('#ansDiv3').html(result.QuestionEntities[0].AnswerEntities[i].AnswerText);
                    break;
                case 4:
                    $('#rad4').hide();
                    $('#ansDiv4').hide();
                    //$('#ansDiv4').html(result.QuestionEntities[0].AnswerEntities[i].AnswerText);
                    break;
                case 5:
                    $('#rad5').hide();
                    $('#ansDiv5').hide();
                    //$('#ansDiv5').html(result.QuestionEntities[0].AnswerEntities[i].AnswerText);
                    break;
                case 6:
                    $('#rad6').hide();
                    $('#ansDiv6').hide();
                    //$('#ansDiv6').html(result.QuestionEntities[0].AnswerEntities[i].AnswerText);
                    break;
                case 7:
                    $('#rad7').hide();
                    $('#ansDiv7').hide();
                    //$('#ansDiv7').html(result.QuestionEntities[0].AnswerEntities[i].AnswerText);
                    break;
                case 8:
                    $('#rad8').hide();
                    $('#ansDiv8').hide();
                    //$('#ansDiv8').html(result.QuestionEntities[0].AnswerEntities[i].AnswerText);
                    break;
                case 9:
                    $('#rad9').hide();
                    $('#ansDiv9').hide();
                    //$('#ansDiv9').html(result.QuestionEntities[0].AnswerEntities[i].AnswerText);
                    break;
                case 10:
                    $('#rad10').hide();
                    $('#ansDiv10').hide();
                   // $('#ansDiv10').html(result.QuestionEntities[0].AnswerEntities[i].AnswerText);
                    break;
                case 11:
                    $('#rad11').hide();
                    $('#ansDiv11').hide();
                    //$('#ansDiv11').html(result.QuestionEntities[0].AnswerEntities[i].AnswerText);
                    break;
                case 12:
                    $('#rad12').hide();
                    $('#ansDiv12').hide();
                    //$('#ansDiv12').html(result.QuestionEntities[0].AnswerEntities[i].AnswerText);
                    break;

            }
        }
    }

}