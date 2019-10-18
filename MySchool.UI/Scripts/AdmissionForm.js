

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

    //do not throw error
    $.fn.dataTable.ext.errMode = 'none';
    //check if datatable is already created then destroy iy and then create it
    if ($.fn.dataTable.isDataTable('#AdmissionListTable')) {
        table = $('#AdmissionListTable').DataTable();
        table.destroy();
    }

    $("#AdmissionListTable").DataTable({
        "processing": true, // for show progress bar
        "serverSide": true, // for process server side
        "filter": false, // this is for disable filter (search box)
        "orderMulti": false, // for disable multiple column at once
        "bLengthChange": false, //disable entries dropdown
        "ajax": {
            "url": loadposturl,
            "type": "POST",
            "datatype": "json"
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
            //,{
            //    "data": "ID", "width": "50px", "render": function (data) {
            //        return '<a href="#" onclick="GetTopicByID(' + data + ')"><i class="fa fa-edit"></i></a>';
            //    }
            //},
            //{
            //    "data": "ID", "width": "50px", "render": function (d) {
            //        return '<a href="#" onclick="Delete(' + d + ')"><i class="fa fa-trash"></i></a>';
            //    }
            //}
        ]
    });
}

//UpdateSelectionStatus

//function UpdateSelectStaus() {
//    var updateStausUrl = $('#updateselectstatus').val();
//    var selectStatus = {
//        ID: $('#GridID').val(),
//        Grade: $('#txtGrade').val(),
//        GradeGroupID: $('#drpGrade').val()
//    };

//        $.ajax({
//            url: updateStausUrl,
//            data: JSON.stringify({ ID: ID }),
//            type: "POST",
//            contentType: "application/json;charser=UTF-8",
//            dataType: "json",
//            success: function (result) {
//                debugger;
//                if (result > 0) {
//                    alert("Grade deleted successfully");

//                    SetUpGrid();

//                }
//                else {
//                    alert("Grade can not be deleted as this is already used.");
//                }
//            },
//            error: function () {
//                alert(errormessage.responseText);
//            }
//        });
    
//}