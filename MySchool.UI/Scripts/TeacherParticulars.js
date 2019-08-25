//import { Function } from "core-js";


function SaveOrUpdate()
{
    var myTable = $('#tblSubject tbody');
    var dataArr = [];

    myTable.find('tr').each(function (i) {
        var $tds = $(this).find('td'),
            sub = $tds.eq(1).text(),
            psub = $tds.eq(2).text()
        console.log(sub);
        console.log(psub);


        //var sritems = [],
        //    total = 0,

        //    products.each(function (index) {

        //        var offset = (index === 0) ? 1 : 0,
        //            sku = $.trim($(this).find('td').eq(offset + 4).text()),
        //            qty = parseInt($(this).find('td').eq(offset + 0).text(), 10),
        //            price = parseFloat($(this).find('td').eq(offset + 6).text().replace(/[^0-9\.]+/g, ""));

        //        total += (qty * price);

        //        //push the object onto the array
        //        sritems.push({
        //            "productId": sku,
        //            "qty": qty,
        //            "price": price
        //        });

            //});
    });

}
