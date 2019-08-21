function validate() {

}

function SaveOrUpdate() {
    var postUrl = $('#saverorupdate').val(); 
 //    console.log(grade);

    var dataArr = [];
    $("tblSubject td").each(function () {
        dataArr.push($(this).html());
    });
    
    $.ajax({
        url: postUrl,
        data: JSON.stringify({ teachenetities: dataArr}),
        type: "POST",
        url: postUrl,
        data: "content=" + dataArr,
        success: function (data) {
            console.log(data);// alert the data from the server
        },
        error: function () {
        }
    });
}



//console.log(section);
