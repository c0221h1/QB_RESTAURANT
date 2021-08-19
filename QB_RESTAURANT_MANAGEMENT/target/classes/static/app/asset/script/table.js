
//-------------Hiển thị bàn------------//
function getAllDesk(){
    $.ajax({
        type: "GET",
        url: "/allDesk"
    }).done(function (desks){
        let content = "";
        for (let i = 0; i < desks.length; i++) {
            content += `
                    <div class="table-container">
                    ${desks[i].hidden ?
                    '' :
                    `<div class="table-infor"><p>${desks[i].tableName}
                       ${desks[i].book && desks[i].book !== (null +"h "+ null) ?
                        `<span style="color: red">(Đặt lúc ${desks[i].book})</span>` :
                        ''}
                        </p>
                    <div class="table-img">
                    ${desks[i].custom ?
                    '<img src="/app/asset/img/table1.jpg">' :
                    '<img src="/app/asset/img/table2.jpg">'}
                    <div class="portfolio-info">${desks[i].custom ?
                    '<p style="color: red; font-weight:bold;">Exist</p>' :
                    '<p style="color: blue; font-weight:bold;">Empty</p>'}
                    <div class="portfolio-links">
                    <a href="#" data-toggle="modal" onclick="getDesk(${desks[i].custom}, ${desks[i].tableId})"><i class="fas fa-eye fa-sm"></i></a>
                    </div>
                    </div>
                    </div>
                    </div>`}
                        </div>
                `;
        }
        $("#show").html(content);
    })
}
getAllDesk();

function getDesk(custom, tableId) {
    $.ajax({
        type: "GET",
        url: `/tableBook/${tableId}`,
        success: function (desk) {
            $('#tableName').text(desk.tableName);
        }
    });
    if (!custom) {
        Swal.fire({
            title: 'Bạn có muốn đổi bàn thành có khách?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Vâng, hãy đổi!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type : "PUT",
                    url : `/tableCustom/${tableId}`
                }).done(function () {
                    getAllDesk();
                    Swal.fire(
                        'Đổi thành công!',
                        'Bạn có thể order món ăn.',
                        'success'
                    ).then(() => {
                        $('#modalQuickView').modal('show');
                        $('#idTableChange').val(tableId);
                        $.ajax({
                            type: "GET",
                            url: `/tableBook/${tableId}`,
                            success: function (desk) {
                                $('#tableChange').text(desk.tableName);
                            }
                        });
                        $.ajax({
                            type: "GET",
                            url: "/deskChange"
                        }).done(function (desks){
                            let content = "";
                            for (let i = 0; i < desks.length; i++) {
                                content += `<option value="${desks[i].tableId}">${desks[i].tableName}</option>`;
                            }
                            $("#tableNewChange").html(content);
                        });
                    });
                    let newDesk = {
                        tableId : tableId
                    }
                    let time = new Date();
                    let newOrder = {
                        orderTime : time,
                        desk : newDesk
                    }
                    $.ajax({
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json'
                        },
                        type: "POST",
                        url: "/app/createOrder",
                        data: JSON.stringify(newOrder),
                    }).done(function (order){
                        $('#id-order').val(order.orderId);
                        $(".bill-container").html(" ");
                    })
                });
            }
        })
    } else {
        $('#modalQuickView').modal('show');
        $('#idTableChange').val(tableId);
        $.ajax({
            type: "GET",
            url: `/app/getOrder/${tableId}`
        }).done(function (order) {
            $.ajax({
                type: "GET",
                url: `/tableBook/${tableId}`,
                success: function (desk) {
                    $('#tableChange').text(desk.tableName);
                }
            });
            $.ajax({
                type: "GET",
                url: "/deskChange"
            }).done(function (desks){
                let content = "";
                for (let i = 0; i < desks.length; i++) {
                    content += `<option value="${desks[i].tableId}">${desks[i].tableName}</option>`;
                }
                $("#tableNewChange").html(content);
            });
           $("#id-order").val(order.orderId);
           let id = order.orderId;
            drawListOrderDetail(id);
        })
    }
}

function changeDesk() {
    let idDeskChange = $('#idTableChange').val();
    let idDeskNewChange = $('#tableNewChange').val();
    $.ajax({
        type: "PUT",
        data: { 'id1' : idDeskChange, 'id2' : idDeskNewChange },
        url: "/deskChange"
    }).done(function () {
        getAllDesk();
        $('#modalDeskChange').modal('hide');
        $('#modalQuickView').modal('hide');
        App.showSuccessAlert("Đổi bàn thành công!!");
    }).fail(()=>{
        App.showErrorAlert("Lỗi ! Không đổi được!!");
    })
}

function getToday(){
    let today = new Date();
    let dd = String(today.getDate()).padStart(2, '0');
    let mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    let yyyy = today.getFullYear();
    return `${yyyy}-${mm}-${dd}`;
}

//-------------Hiển thị bàn------------//


function up(max) {
    document.getElementById("myNumber").value = parseInt(document.getElementById("myNumber").value) + 1;
    if (document.getElementById("myNumber").value >= parseInt(max)) {
        document.getElementById("myNumber").value = max;
    }
}

function down(min) {
    document.getElementById("myNumber").value = parseInt(document.getElementById("myNumber").value) - 1;
    if (document.getElementById("myNumber").value <= parseInt(min)) {
        document.getElementById("myNumber").value = min;
    }
}

function showModalChange() {
    $('#modalDeskChange').modal('show')
}
// function drawOrder() {
//     let content = "<div class=\"current-order panel-body overflow-auto border\">";
//     let total = 0;
//     if (order.products.length !== 0){
//         for (let i = 0; i < order.products.length; i++) {
//             total += order.products[i].price * order.products[i].amount;
//             content += `
//               <ul class="list-group mb-3 ">
//                 <li class=" d-flex justify-content-between p-3 pb-0 ">
//                   <div>
//                     <h6 class="my-0" style="width: 150px; white-space: nowrap;  overflow: hidden; text-overflow: ellipsis">${order.products[i].product_name}</h6>
//                   </div>
//                   <div>
//                     <p>
//                     <i value="${order.products[i].product_id}" class="fas fa-minus btn btn-outline-dark subToProduct"></i>
//                       <span class="w-50 text-center"> ${order.products[i].amount}</span>
//                       <i value="${order.products[i].product_id}" class="fas fa-plus btn btn-outline-dark addMoreProduct"></i>
//                     </p>
//                   </div>
//                   <span class="text-muted" >${order.products[i].price*order.products[i].amount} $</span>
//                 </li>
//               </ul>`;
//         }
//         content += "</div>";
//         order.total_price = total;
//         let subtotal = order.total_price;
//         let voucher_id = order.voucher.voucher_id;
//         let discount = order.voucher.percent_discount;
//         let tax = Math.round((((order.total_price*(1-order.voucher.percent_discount/100))*0.1) + Number.EPSILON) * 100) / 100;
//         let total_product = Math.round((((order.total_price *(1- order.voucher.percent_discount/100)) + (Math.round((((order.total_price*(1-order.voucher.percent_discount/100))*0.1) + Number.EPSILON) * 100) / 100)) + Number.EPSILON)* 100) / 100 ;
//
//         content += `
//             <div class="panel-body border">
//               <div class="d-flex justify-content-between p-3 pb-0">
//                 <p>Subtotal</p>
//                 <p><strong>${subtotal}</strong></p>
//               </div>
//               <div class="d-flex justify-content-between p-3 pb-0">
//                 <p>Discounts</p>
//                 <input hidden id="voucher_id" value="${voucher_id}">
//                 <p><strong>${discount} %</strong></p>
//               </div>
//               <div class="d-flex justify-content-between p-3 pb-0">
//                 <p>Sales Tax</p>
//                 <p><strong>${tax} $</strong></p>
//               </div>
//               <hr>
//               <div class="d-flex justify-content-between p-3 pb-0">
//                 <h5>Total</h5>
//                 <input hidden id="total" value="${total_product}">
//                 <h5><strong>${total_product} $</strong></h5>
//               </div>
//             </div>
//       `;
//         order.total_price = total_product;
//
//         $('#allList').html(content);
//
//         $(".addMoreProduct").on("click",function (){
//             let id = $(this).attr("value");
//             getProduct(id);
//         })
//
//         $(".subToProduct").on("click",function (){
//             let id = $(this).attr("value");
//             subProduct(id);
//         })
//     }
// }

