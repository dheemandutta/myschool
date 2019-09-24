function GetNextQuestion( pageindex, pagesize, radioValue) {
    var loadposturl = $('#loaddata').val();
    console.log('hi');
    console.log(pageindex);
    console.log(pagesize);

    var quesId = $('#quesId').val();

    $.getJSON(loadposturl, { pageindex: pageindex, pagesize: pagesize, radioValue: radioValue,quesId: quesId}, function (result) {

            console.log(result);
            console.log(result.QuestionEntities[0].Id);
        console.log(result.QuestionEntities[0].AnswerEntities);
        $('#qCnt').val(result.QuestionCount);
        $('#quesId').val(result.QuestionEntities[0].Id);
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
                $('#ansDiv1').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                $('#rad1').val(result.QuestionEntities[0].AnswerEntities[i - 1].ID);
                $('#rad1').prop('checked', false);

                if (result.QuestionEntities[0].AnswerEntities[i - 1].IsUserAnswer === 1)
                    $('#rad1').prop('checked', true);

                break;
            case 2:
                $('#rad2').show();
                $('#ansDiv2').show();
                $('#ansDiv2').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                $('#rad2').val(result.QuestionEntities[0].AnswerEntities[i - 1].ID);
                $('#rad2').prop('checked', false);
                if (result.QuestionEntities[0].AnswerEntities[i - 1].IsUserAnswer === 1)
                    $('#rad2').prop('checked', true);

                break;
            case 3:
                $('#rad3').show();
                $('#ansDiv3').show();
                $('#ansDiv3').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                $('#rad3').val(result.QuestionEntities[0].AnswerEntities[i - 1].ID);
                $('#rad3').prop('checked', false);
                if (result.QuestionEntities[0].AnswerEntities[i - 1].IsUserAnswer === 1)
                    $('#rad3').prop('checked', true);
                break;
            case 4:
                $('#rad4').show();
                $('#ansDiv4').show();
                $('#ansDiv4').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                $('#rad4').val(result.QuestionEntities[0].AnswerEntities[i - 1].ID);
                $('#rad4').prop('checked', false);
                if (result.QuestionEntities[0].AnswerEntities[i - 1].IsUserAnswer === 1)
                    $('#rad4').prop('checked', true);
                break;
            case 5:
                $('#rad5').show();
                $('#ansDiv5').show();
                $('#ansDiv5').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                $('#rad5').val(result.QuestionEntities[0].AnswerEntities[i - 1].ID);
                $('#rad5').prop('checked', false);
                if (result.QuestionEntities[0].AnswerEntities[i - 1].IsUserAnswer === 1)
                    $('#rad5').prop('checked', true);
                break;
            case 6:
                $('#rad6').show();
                $('#ansDiv6').show();
                $('#ansDiv6').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                $('#rad6').val(result.QuestionEntities[0].AnswerEntities[i - 1].ID);
                $('#rad6').prop('checked', false);
                if (result.QuestionEntities[0].AnswerEntities[i - 1].IsUserAnswer === 1)
                    $('#rad6').prop('checked', true);
                break;
            case 7:
                $('#rad7').show();
                $('#ansDiv7').show();
                $('#ansDiv7').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                $('#rad7').val(result.QuestionEntities[0].AnswerEntities[i - 1].ID);
                $('#rad7').prop('checked', false);
                if (result.QuestionEntities[0].AnswerEntities[i - 1].IsUserAnswer === 1)
                    $('#rad7').prop('checked', true);
                break;
            case 8:
                $('#rad8').show();
                $('#ansDiv8').show();
                $('#ansDiv8').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                $('#rad8').val(result.QuestionEntities[0].AnswerEntities[i - 1].ID);
                $('#rad8').prop('checked', false);
                if (result.QuestionEntities[0].AnswerEntities[i - 1].IsUserAnswer === 1)
                    $('#rad8').prop('checked', true);
                break;
            case 9:
                $('#rad9').show();
                $('#ansDiv9').show();
                $('#ansDiv9').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                $('#rad9').val(result.QuestionEntities[0].AnswerEntities[i - 1].ID);
                $('#rad9').prop('checked', false);
                if (result.QuestionEntities[0].AnswerEntities[i - 1].IsUserAnswer === 1)
                    $('#rad9').prop('checked', true);
                break;
            case 10:
                $('#rad10').show();
                $('#ansDiv10').show();
                $('#ansDiv10').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                $('#rad10').val(result.QuestionEntities[0].AnswerEntities[i - 1].ID);
                $('#rad10').prop('checked', false);
                if (result.QuestionEntities[0].AnswerEntities[i - 1].IsUserAnswer === 1)
                    $('#rad10').prop('checked', true);
                break;
            case 11:
                $('#rad11').show();
                $('#ansDiv11').show();
                $('#ansDiv11').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                $('#rad11').val(result.QuestionEntities[0].AnswerEntities[i - 1].ID);
                $('#rad11').prop('checked', false);
                if (result.QuestionEntities[0].AnswerEntities[i - 1].IsUserAnswer === 1)
                    $('#rad11').prop('checked', true);
                break;
            case 12:
                $('#rad12').show();
                $('#ansDiv12').show();
                $('#ansDiv12').html(result.QuestionEntities[0].AnswerEntities[i - 1].AnswerText);
                $('#rad12').val(result.QuestionEntities[0].AnswerEntities[i - 1].ID);
                $('#rad12').prop('checked', false);
                if (result.QuestionEntities[0].AnswerEntities[i - 1].IsUserAnswer === 1)
                    $('#rad12').prop('checked', true);
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


        //Create html table 
        var qTab = $('#answertable tr');
        $('#answertable tr td').remove();
        console.log('Answered Question List');
        console.log(result.AnsweredQuestions.length);

        

    } //end for

    for (k = 0; k < result.AnsweredQuestions.length; k++) {

        if (result.AnsweredQuestions[k].HasAnswered === 1) {
            $(qTab).append(' <td style="color: black ; background-color:forestgreen;">' + result.AnsweredQuestions[k].RowNo + '</td>');
        }
        else {
            $(qTab).append(' <td style="color: black ; ">' + result.AnsweredQuestions[k].RowNo + '</td>');
        }
    }

}