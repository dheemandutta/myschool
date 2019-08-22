function validate() {

}

function SaveOrUpdate() {
    //var postUrl = $('#saverorupdate').val(); 
    //var dataArr = [];
    //$("tblSubject td").each(function () {
    //    dataArr.push($(this).html());
    //});
    
    //$.ajax({
    //    url: postUrl,
    //    data: JSON.stringify({ teachenetities: dataArr}),
    //    type: "POST",
    //    url: postUrl,
    //    data: "content=" + dataArr,
    //    success: function (data) {
    //        console.log(data);
    //    },
    //    error: function () {
    //    }
    //});

    
    var dataArr = [];
    $("tblSubject td").each(function () {
    dataArr.push($(this).html());

    });
    
    
    //$.ajax({
    //    url: postUrl,
    //    data: JSON.stringify({ teachenetities: dataArr }),
    //    type: "POST",
    //    data: dataArr,
    //    success: function (data) {
    //        console.log(data);
    //    },
    //    error: function () {
    //    }
    //});

}



//console.log(section);
