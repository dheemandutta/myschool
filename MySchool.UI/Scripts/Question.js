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

    $('#QuestionID').val("");
    $('#summernote').val("");
    $('#drpTopic').val("");
    //$('#ImagePath').val("");
    $('#Marks').val("");
}

function Add() {
    var postUrl = $('#saveQuestion').val();

    var res = validate();
    if (res === false) {
        return false;
    }

    //alert($('#TopicName').val());

    var question = {
        Id: $('#QuestionID').val(),
        QuestionText: $('#summernote').summernote('code'),
        TopicId: $('#drpTopic').val(),
        //ImagePath: $('#ImagePath').val(),
        Marks: $('#Marks').val()
    };

    console.log(question);

    //$.ajax({
    //    url: postUrl,
    //    data: JSON.stringify({ questionEntities: question }),
    //    type: "POST",
    //    contentType: "application/json;charset=utf-8",
    //    dataType: "json",
    //    success: function (result) {
    //        if (result > 0) {
    //            clearTextBox();
    //            SetUpGrid();
    //            swal("Good job!", "Data Saved Successfully", "success");
    //        }
    //        else {
    //            clearTextBox();
    //            SetUpGrid();
    //            swal("Sorry!", "Data Not Saved", "error");
    //        }
    //    },
    //    error: function (errormessage) {
    //        alert(errormessage.responseText);
    //    }
    //});
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
    if ($.fn.dataTable.isDataTable('#QuestionTable')) {
        table = $('#QuestionTable').DataTable();
        table.destroy();
    }

    var table =$("#QuestionTable").DataTable({
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
                "data": "QuestionText", "name": "QuestionText", "autoWidth": true
            },
            {
                "data": "TopicName", "name": "TopicId", "autoWidth": true
            },
            //{
            //    "data": "ImagePath", "name": "ImagePath", "autoWidth": true
            //},
            {
                "data": "Marks", "name": "Marks", "autoWidth": true
            },
            {
                "data": "Id", "width": "50px", "render": function (data) {
                    return '<a href="#" onclick="GetQuestionByID(' + data + ')"><i class="fa fa-edit"></i></a>';
                }
            },
            {
                "data": "Id", "width": "50px", "render": function (d) {
                    return '<a href="#" onclick="Delete(' + d + ')"><i class="fa fa-trash"></i></a>';
                }
            }
        ]
    });

        table.on('click', 'tr', function () {
            var id = table.row(this).data();
            console.log(id.Id);
            console.log(id);
        ShowChildren(id.Id);
    });
}

function GetQuestionByID(parID) {
    console.log(parID);

    var x = $("#getQuestionByID").val();

    $.getJSON(x, { Id: parID }, function (result) {
        console.log(result);

        $('#summernote').summernote('code', result.QuestionText); // $('#summernote').summernote('editor.insertText', 'hello world'));
        $('#drpTopic').val(result.TopicId);
        //$('#ImagePath').val(result.ImagePath);
        $('#Marks').val(result.Marks);

        $('#QuestionID').val(result.Id);
    });
    return false;
}

function Delete(Id) {
    var ans = confirm("Do you want to delete the record?");
    var deleteUrl = $('#deleteQuestion').val();
    if (ans) {
        $.ajax({
            url: deleteUrl,
            data: JSON.stringify({ ID: Id }),
            type: "POST",
            contentType: "application/json;charser=UTF-8",
            dataType: "json",
            success: function (result) {

                if (result > 0) {
                    alert("Grade deleted successfully");

                    SetUpGrid();

                }
                else {
                    alert("Grade can not be deleted as this is already used.");
                }
            },
            error: function () {
                alert(errormessage.responseText);
            }
        });
    }
}




function SaveOrUpdate() {
    var postUrl = $('#saveQuestion').val();
    var mySubjectTable = $('#tblSubject tbody');
    var dataArrSubject = [];

    mySubjectTable.find('tr').each(function (i) {
        console.log('in here');
        var $tds = $(this).find('td');
        var objSub = {
          //  subId: $tds.eq(0).find('input[name="record"]').attr('id'),
            AnswerText: $tds.eq(1).text(),
            IsRightAnswer: $tds.eq(2).text() === 'No' ? 0:1
        };
        dataArrSubject.push(objSub);
    });

    console.log(dataArrSubject);

    var question = {
        Id: $('#QuestionID').val(),
        QuestionText: $('#summernote').summernote('code'),
        TopicId: $('#drpTopic').val(),
        //ImagePath: $('#ImagePath').val(),
        Marks: $('#Marks').val()
      
    };

    console.log(question);

    var qentities = {
        QuestionEntities: question, 
        AnswerEntities: dataArrSubject
    };

    //var myQualificationTable = $('#tblQualification tbody');
    //var datatArrQualification = [];
    //myQualificationTable.find('tr').each(function (i) {

    //    var $tdsqual = $(this).find('td'),
    //        qual = $tds.eq(1).text(),
    //        qualStatus = $tds.eq(2).text(),
    //        qualDate = $tds.eq(3).text()

    //    datatArrQualification.push(tdsqual);
    //});


     $.ajax({
        url: postUrl,
         data: JSON.stringify({ questionEntities: qentities }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result > 0) {
                clearTextBox();
                SetUpGrid();
                swal("Good job!", "Data Saved Successfully", "success");
            }
            else {
                clearTextBox();
                SetUpGrid();
                swal("Sorry!", "Data Not Saved", "error");
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}



//function SetUpGrid() {
//    var loadposturl = $('#loaddata').val();

//    //do not throw error
//    $.fn.dataTable.ext.errMode = 'none';

//    //check if datatable is already created then destroy iy and then create it
//    if ($.fn.dataTable.isDataTable('#QuestionTable')) {
//        table = $('#QuestionTable').DataTable();
//        table.destroy();
//    }


//    // alert('hh');
//    var table = $("#QuestionTable").DataTable({
//        "dom": 'Bfrtip',
//        "rowReorder": false,
//        "ordering": false,
//        "filter": false, // this is for disable filter (search box)

//        "ajax": {
//            "url": loadposturl,
//            "type": "POST",
//            "datatype": "json"
//        },
//        "columns": [
//            {
//                "data": "QuestionText", "name": "QuestionText", "autoWidth": true
//            },
//            {
//                "data": "TopicName", "name": "TopicId", "autoWidth": true
//            },
//            //{
//            //    "data": "ImagePath", "name": "ImagePath", "autoWidth": true
//            //},
//            {
//                "data": "Marks", "name": "Marks", "autoWidth": true
//            },
//            {
//                "data": "Id", "width": "50px", "render": function (data) {
//                    return '<a href="#" onclick="GetQuestionByID(' + data + ')"><i class="fa fa-edit"></i></a>';
//                }
//            },
//            {
//                "data": "Id", "width": "50px", "render": function (d) {
//                    return '<a href="#" onclick="Delete(' + d + ')"><i class="fa fa-trash"></i></a>';
//                }
//            }

//        ]
//    });

//    //table.on('click', 'tr', function () {
//    //    var id = table.row(this).data();
//    //    ShowChildren(id.ID);
//    //});
//}







function ShowChildren(childdata) {
    var lposturl = $('#lcd').val();
    var pcatId = childdata;

    //do not throw error
    $.fn.dataTable.ext.errMode = 'none';

    if ($.fn.dataTable.isDataTable('#childtable')) {
        table = $('#childtable').DataTable();
        table.destroy();
    }

    $("#childtable").DataTable({
        "processing": true, // for show progress bar
        "serverSide": true, // for process server side
        "filter": false, // this is for disable filter (search box)
        "orderMulti": false, // for disable multiple column at once
        "bLengthChange": false, //disable entries dropdown
        "bInfo": false,
        "deferRender": true,
        "ajax": {
            "url": lposturl,
            "type": "POST",
            "data": {
                Id: pcatId

            },
            "datatype": "json"
        },

        "columns": [

            { "data": "ChoiceText", "name": "ChoiceText", "autoWidth": true },
            { "data": "IsAnswer", "name": "IsAnswer", "autoWidth": true }

            //{
            //    "data": "FundCategoryId", "width": "50px", "render": function (data) {
            //        return '<a href="#" onclick="GetFundCategoryById(' + data + ')">Edit</a>';
            //    }
            //},
            //{
            //    "data": "FundCategoryId", "width": "50px", "render": function (d) {
            //        //debugger;
            //        return '<a href="#" onclick="Delete(' + d + ')">Delete</a>';
            //    }
            //}

        ]//,

        //"rowId": "Id",
        //"dom": "Bfrtip",
        //"fnDrawCallback": function (oSettings) {
        //    if ($('#childtable tr').length < 11) {
        //        //$('.dataTables_paginate').hide();
        //        $('#childtable_paginate').hide();
        //    }
        //}
    });
}