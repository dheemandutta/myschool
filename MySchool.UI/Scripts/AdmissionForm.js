

//saveadmissionform




function SaveOrUpdate() {
    var postUrl = $('#saveadmissionform').val();
    var res = validate;
    if (res === false) {
        return false;
    }

    var admissionform = {
        ID: $('#FormID').val(),
        //FormNumber
        SFName: $('#txtStudentFirstName').val(),
        SMName: $('#txtStudentMiddleName').val(),
        SLNAme: $('#txtStudentLastName').val(),
        Gender: $('#drpGender').val(),
        DOB: $('#txtDateofBirth').val(),
        Religion: $('#drpReligion').val(),
        Caste: $('#drpCaste').val(),
        FFName: $('#txtFatherFirstName').val(),
        FMName: $('#txtFatherMiddleName').val(),
        FLName: $('#txtFatherLastName').val(),
        MFName: $('#txtMotherFirstName').val(),
        MMName: $('#txtMotherMiddleName').val(),
        MLName: $('#txtMotherFirstName').val(),
        GFName: $('#txtGuardianFirstName').val(),
        GMName: $('#txtGuardianMiddleName').val(),
        GLName: $('#txtGuardianLastName').val(),
        Address: $('#txtAddress').val(),
        MoutherTounge: $('#txtMotherToung').val(),
        FatherQualification: $('#txtQualificationFather').val(),
        MotherQualification: $('#txtQualificationMother').val(),
        FatherOccupation: $('#txtOccupationFather').val(),
        FatherAnnualIncome: $('#txtAnnualIncomeFather').val(),
        MotherOccupation: $('#txtOccupationMother').val(),
        MotherAnnualIncome: $('#txtAnnualIncomeMother').val(),
        GradeID: $('#drpGrade').val(),

        // Selection of Academic year

        YearID: $('#').val(), 

        IdentificationMarks: $('#txtIdentificationMarks').val(),
        SpecialMedicalProblem: $('#txtSpecialMedicalProblem').val(),
        RelationWithGuardian : $('#txtRelationship').val(),

        //Photo upload part
        //SPhoto: $('#').val(),
        //FPhoto: $('#').val(),
        //FSign: $('#').val(),
        //MPhoto: $('#').val(),
        //MSign: $('#').val(),

        FContactNo: $('#txtContactNoFather').val(),
        MContactNo: $('#txtContactNumberMother').val(),
        Email: $('#txtEmail').val(),
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

function loadData() {
    var loadposturl = $('#loaddata').val();
    $.ajax({
        url: loadposturl,
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            SetUpGrid();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function SetUpGrid() {

    var loadposturl = $('#loaddata').val();

    $.fn.dataTable.ext.errMode = 'none';
    if ($.fn.dataTable.isDataTable('#AdmissionListTable')) {
        table = $('#AdmissionListTable').DataTable();
        table.destroy();
    }
    // alert('hh');
    var mytable = $("#AdmissionListTable").DataTable({
        "processing": true,
        "serverSide": true,
        "filter": false,
        "orderMulti": false,
        "bLengthChange": false,
        "ajax": {
            "url": loadposturl,
            "type": "POST",
            "datatype": "json"
            //"data": { searchvalue: searchval }
        },
        "columns": [
            {
                "data": "FormNumber", "name": "FormNumber", "autoWidth": true
            },
            {
                "data": "StudentName", "name": "StudentName", "autoWidth": true
            },
            {
                "data": "DOB1", "name": "DOB", "autoWidth": true
            },
            {
                "data": "Address", "name": "Address", "autoWidth": true
            },
            {
                "data": "IdentificationMarks", "name": "IdentificationMarks", "autoWidth": true
            }
            ,
            {
                "render": function (data, type, JsonResultRow, meta) {
                    console.log('in grid render');
                    console.log(JsonResultRow);
                    if (JsonResultRow.isSelectedForAdmission === true) {
                        return '<input type="button" value = "Select" onclick="UpdateSelectionForAdmissionStatus(' + data + ')">';
                    }
                    else {
                        return '<input type="button" value = "De-Select" onclick="UpdateSelectionForAdmissionStatus(' + data + ')">';
                    }
                }
            }
        ]
    });


    
}


function UpdateSelectionForAdmissionStatus(ID, FormNumber) {

    var updatestatus = $('#updateselectionforadmissionstatus').val();
    $.ajax({
        url: updatestatus,
        data: JSON.stringify({ ID: ID}),
        type: "POST",
        contentType: "application/json;charser=UTF-8",
        dataType: "json",
        success: function (result) {
            //alert("Selected Form Number ...........................");
            alert(FormNumber);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}



function SaveOrUpdateForActualAdmission() {          ////////////////////////////////////////////////////////////////////////////////
    var postUrl = $('#saveOrUpdateForActualAdmission').val();
    var res = validate;
    if (res === false) {
        return false;
    }

    var admissionform = {
        ID: $('#ID').val(),
        //FormNumber
        AdmissionNumber: $('#txtAdmissionNumber').val(),
        FormNumber: $('#txtFormNumber').val(),

        SFName: $('#txtStudentFirstName').val(),
        SMName: $('#txtStudentMiddleName').val(),
        SLNAme: $('#txtStudentLastName').val(),
        Gender: $('#drpGender').val(),
        DOB: $('#txtDateofBirth').val(),
        Religion: $('#drpReligion').val(),
        Caste: $('#drpCaste').val(),
        FFName: $('#txtFatherFirstName').val(),
        FMName: $('#txtFatherMiddleName').val(),
        FLName: $('#txtFatherLastName').val(),
        MFName: $('#txtMotherFirstName').val(),
        MMName: $('#txtMotherMiddleName').val(),
        MLName: $('#txtMotherFirstName').val(),
        GFName: $('#txtGuardianFirstName').val(),
        GMName: $('#txtGuardianMiddleName').val(),
        GLName: $('#txtGuardianLastName').val(),
        Address: $('#txtAddress').val(),
        MoutherTounge: $('#txtMotherToung').val(),
        FatherQualification: $('#txtQualificationFather').val(),
        MotherQualification: $('#txtQualificationMother').val(),
        FatherOccupation: $('#txtOccupationFather').val(),
        FatherAnnualIncome: $('#txtAnnualIncomeFather').val(),
        MotherOccupation: $('#txtOccupationMother').val(),
        MotherAnnualIncome: $('#txtAnnualIncomeMother').val(),
        GradeID: $('#drpGrade').val(),
        YearID: $('#drpYear').val(),

        IdentificationMarks: $('#txtIdentificationMarks').val(),
        SpecialMedicalProblem: $('#txtSpecialMedicalProblem').val(),
        RelationWithGuardian: $('#txtRelationship').val(),

        //Photo upload part
        //SPhoto: $('#').val(),
        //FPhoto: $('#').val(),
        //FSign: $('#').val(),
        //MPhoto: $('#').val(),
        //MSign: $('#').val(),

        FContactNo: $('#txtContactNoFather').val(),
        MContactNo: $('#txtContactNumberMother').val(),
        Email: $('#txtEmail').val()
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