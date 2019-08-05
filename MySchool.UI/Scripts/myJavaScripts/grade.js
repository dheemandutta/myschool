//import { fstat } from "fs";

function validate() {
    var isValid = true;
    if ($('#txtGrade').val().trim() == "") {
        isValid = false;
    }
    //if ($('#drpGrade').val().trim() == "" || $('#drpGrade').val("Select")) {

    else if ($('#drpGrade').val().trim() == "") {
        isValid = false;
    }
    else {
        isValid = true;
    }
    return isValid;
}

function ClearAll() {
    $('#txtGrade').val('');
    $('#drpGrade').val('');
    //$('#btnSave').val('Save');
}

//function SaveOrUpdate() {
//    var postUrl = $('#savegrade').val();
//    var res = validate;
//    if (res == false) {
//        return false;
//    }

//    var grade = {
//        Grade: $('#txtGrade').val(),
//        GradeGroupID: $('#drpGrade').val(),
//    };

//    $.ajax({
//        url: postUrl,
//        data: JSON.stringify(grade),
//        type: "POST",
//        contentType: "application/json;charset=utf-8",
//        dataType: "json",
//        success: function (result) {
//            if (result > 0) {
//                alert("Data saved successfully");
               
//    //          SetUpGrid();
//            }
//            else {
//                alert("Data not saved");
//            }
//        },
//        error: function (errormessage) {
//            alert(errormessage.responseText);
//        }
//    });
//}

//function CreateParameter() {
//    return CreateCommaSeperatedValues().then(function (commaseperatedIDs) {
//        //debugger;
//        var OwnerDetails = {

//            ID: $('#ID').val(),
//            CompanyName: $('#CompanyName').val(),
//            ProprietorFName1: $('#ProprietorFName1').val(),
//            ProprietorMName1: $('#ProprietorMName1').val(),
//            ProprietorLName1: $('#ProprietorLName1').val(),
//            ProprietorFName2: $('#ProprietorFName2').val(),
//            ProprietorMName2: $('#ProprietorMName2').val(),
//            ProprietorLName2: $('#ProprietorLName2').val(),
//            AddressLine1: $('#AddressLine1').val(),
//            PinCode: $('#PinCode').val(),
//            Locality: $('#Locality').val(),
//            GSTIN: $('#GSTIN').val(),
//            Phone1: $('#Phone1').val(),
//            Phone2: $('#Phone2').val(),

//            UserName: $('#UserName').val(),
//            Password: $('#Password').val(),
//            ActivationStartDate: $('#ActivationStartDate').val(),
//            ActivationEndDate: $('#ActivationEndDate').val(),

//            DistributorIds: commaseperatedIDs  // $('#ChannelID').val(),
//        };

//        //Console.log("Package", PackPackChannelDetails);
//        console.log("Selected Distributor", commaseperatedIDs);
//        return OwnerDetails;
//    });
//}

//function Add() {
//    var GroupsJsonObject = { WF: [] };
//    var checkedIds = $('#ddlAdmCru').val();
//    console.log('In Dept Add------');
//    // console.log(checkedIds);
//    GroupsJsonObject.WF.push({ d: checkedIds.join(",") });
//    var posturl = $('#Owneradd').val();
//    //var PackageJsonObject = { WF: [] };
//    //debugger;

//    var res = validate();
//    if (res === false) {
//        return false;
//    }


//    CreateParameter().done(function (OwnerDetails) {
//        $.ajax({
//            url: posturl,
//            data: JSON.stringify(OwnerDetails),
//            type: "POST",
//            contentType: "application/json;charset=utf-8",
//            dataType: "json",
//            success: function (result) {
//                loadData();
//                $('#myModal').modal('hide');
//                clearTextBox();
//            },
//            error: function (errormessage) {
//                alert(errormessage.responseText);
//            }
//        });
//    });
//}
