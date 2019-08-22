//import { Function } from "core-js";


function SaveOrUpdate()
{
    var myTable = $('#tblSubject table tbody');
    var dataArr = [];
    dataArr.push({
        myTable.find('tr').each(function (i, el) {
        var $tds = $(this).find('td'),
            subject = $tds.eq(1).text(),
            primarySubject = $tds.eq(2).text();
            }
        });
    console.log(dataArr);
}
