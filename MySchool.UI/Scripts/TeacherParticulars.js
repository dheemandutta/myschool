//import { Function } from "core-js";


function SaveOrUpdate() {
    var mySubjectTable = $('#tblSubject tbody');
    var dataArrSubject = [];

    mySubjectTable.find('tr').each(function (i) {
        console.log('in here');
        var $tds = $(this).find('td');
        var objSub = {
            subId: $tds.eq(0).find('input[name="record"]').attr('id'),
            sub: $tds.eq(1).text(),
            psub: $tds.eq(2).text()
        };

            //subId = $tds.eq(0).('id'),
            //sub = $tds.eq(1).text(),
            //psub = $tds.eq(2).text()

        dataArrSubject.push(objSub);   
    });

    console.log(dataArrSubject);

    var myQualificationTable = $('#tblQualification tbody');
    var datatArrQualification = [];
    myQualificationTable.find('tr').each(function (i) {

        var $tdsqual = $(this).find('td'),
            qual = $tds.eq(1).text(),
            qualStatus = $tds.eq(2).text(),
            qualDate = $tds.eq(3).text()

        datatArrQualification.push(tdsqual);
    });

    //var teacher = {
    //    ID: $('#TeacherID').val(),
    //    FName: $('#txtFirstName').val(),
    //    LName: $('#txtLastName').val(),
    //    Photo: $('#').val(),
    //    Gender: $('#drpGender').val(),
    //    Address: $('#txtAddress').val(),
    //    Ph1: $('#txtPhoneNumberOne').val(),
    //    Ph2: $('#txtPhoneNumberTwo').val(),
    //    StartDate: $('#dtJoiningDate').val(),
    //    EndDate: $('#dtRetirementDate').val(),
    //    Comments: $('#txtComments').val(),
    //    Designation: $('#txtDesignation').val(),

    //    QualificationID: $('#TeacherQualificationID').val(),

    //    QualName: $('#').val(),
    //    QualCertPath: $('#').val(),
    //    QualStatus: $('#').val(),
    //    QualCompletionDate: $('#').val(),

    //    TeacherSubjectId: $('#TeacherSubjectID').val(),

    //    SubjectID: $('#').val(),
    //    isPrimarySubject: $('#').val(),

    //}
}


   