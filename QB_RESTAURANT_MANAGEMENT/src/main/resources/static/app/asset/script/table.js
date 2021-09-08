
//-------------Hiển thị bàn------------//
function getAllDesk(){
    $.ajax({
        type: "GET",
        url: "/allDesk"
    }).done(function (desks){
        let content = "";
        for (let i = 0; i < desks.length; i++) {
            content += `
                    <div class="table-container">${desks[i].hidden ?
                        '' :
                        `<div class="table-infor"><p>${desks[i].tableName}
                               ${desks[i].book && desks[i].book !== (null +"h "+ null) ?
                                `<span style="color: red">(Đặt lúc ${desks[i].book})</span>` :
                                ''}
                                </p>
                            <div class="table-img">${desks[i].custom ?
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
//-------------Hiển thị bàn------------//

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
            showDenyButton: true,
            confirmButtonColor: '#3085d6',
            denyButtonColor: '#d33',
            denyButtonText :`Hủy`,
            confirmButtonText: 'Đồng ý!'
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
                        $('#idTableMerge').val(tableId);
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
                            let content =   "";
                            for (let i = 0; i < desks.length; i++) {
                                if (desks[i].book === (null +"h "+ null) || desks[i].book == null){
                                    content += `
                                <div class="table-container">
                                    <div class="table-infor">
                                        <p>${desks[i].tableName}</p> 
                                        <div class="table-image">
                                            <input type="hidden" id="idTableNewChange" value="${desks[i].tableId}">
                                            <a href="#" onclick="changeDesk()"><img src="/app/asset/img/table2.jpg"></a>
                                        </div>
                                    </div>
                                </div>
                                `;
                                }
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
        $('#idTableMerge').val(tableId);
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
                    if (desks[i].book === (null +"h "+ null) || desks[i].book == null){
                        content += `
                                <div class="table-container">
                                    <div  class="table-infor">
                                        <p>${desks[i].tableName}</p> 
                                        <div class="table-image">
                                            <input type="hidden" id="idTableNewChange" value="${desks[i].tableId}">
                                            <a href="#" onclick="changeDesk(${desks[i].tableId})"><img src="/app/asset/img/table2.jpg"></a>
                                        </div>
                                    </div>
                                </div>
                            `;
                    }
                }
                $("#tableNewChange").html(content);
            });
           $("#id-order").val(order.orderId);
           let id = order.orderId;
            drawListOrderDetail(id);
        })
    }
}

function changeDesk(idNewTableChange) {
        let idDeskChange = $('#idTableChange').val();
        Swal.fire({
        title: 'Bạn có muốn đổi bàn ?',
        icon: 'warning',
        showDenyButton: true,
        confirmButtonColor: '#3085d6',
        denyButtonColor: '#d33',
        denyButtonText :`Hủy`,
        confirmButtonText: 'Đồng ý!'
    }).then((result) => {
        if (result.isConfirmed){
            $.ajax({
                type: "PUT",
                data: {'id1': idDeskChange, 'id2': idNewTableChange},
                url: "/deskChange"
            }).done(function (){
                getAllDesk();
                App.showSuccessAlert("Đổi bàn thành công!!");
                $('.bd-example-modal-sm').modal('hide');
                $('#modalDeskChange').modal('hide');
                $('#modalQuickView').modal('hide');
            }).fail(function (){
                App.showErrorAlert("Đã xảy ra lỗi!")
            })
        }
    })
}

//----------------Show All Table Merge----------------//
function getAllDeskMerge(){
    let id = $('#idTableChange').val();
    $.ajax({
        type: "GET",
        url: `/getAllDeskMerge/${id}`,
    }).done(function (desks){
        let content = "";
        for (let i = 0; i < desks.length; i++) {
            content += `
                <div class="table-container">
                    <div  class="table-infor">
                        <p>${desks[i].tableName}</p> 
                        <div class="table-image">
                            <input type="hidden" id="idTableNewMerge" value="${desks[i].tableId}">
                            <a href="#" onclick="mergeDesk(${desks[i].tableId})"><img src="/app/asset/img/table1.jpg"></a>
                        </div>
                    </div>
                </div>
                  `;
            }
        $('.bg-example-modal-sm').modal('show');
        $("#tableNewMerge").html(content);
    })
}
//----------------Show All Table Merge----------------//

function mergeDesk(idNewDeskMerge) {
    let idDeskMerge = $('#idTableChange').val();
    Swal.fire({
        title: 'Bạn có muốn gộp bàn ?',
        icon: 'warning',
        showDenyButton: true,
        confirmButtonColor: '#3085d6',
        denyButtonColor: '#d33',
        denyButtonText :`Hủy`,
        confirmButtonText: 'Đồng ý!'
    }).then((result) => {
        if (result.isConfirmed){
            $.ajax({
                type: "PUT",
                data: {'id1': idDeskMerge, 'id2': idNewDeskMerge},
                url: "/deskMerge"
            }).done(function (){
                getAllDesk();
                App.showSuccessAlert("Gộp bàn thành  thành công!!");
                $('.bg-example-modal-sm').modal('hide');
                $('#modalDeskChange').modal('hide');
                $('#modalQuickView').modal('hide');
            }).fail(function (){
                App.showErrorAlert("Đã xảy ra lỗi!")
            })
        }
    })
}


function getToday(){
    let today = new Date();
    let dd = String(today.getDate()).padStart(2, '0');
    let mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    let yyyy = today.getFullYear();
    return `${yyyy}-${mm}-${dd}`;
}

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
    $('.bd-example-modal-sm').modal('show');
}





