
//-------------Hiển thị bàn------------//
function getAllDesk(){
    $.ajax({
        type: "GET",
        url: "/allDesk"
    }).done(function (desks){
        let content = "";
        for (let i = 0; i < desks.length; i++) {
            content += `
                    <input hidden id="${desks[i].tableId}">
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
                        $('#modalQuickView').modal('show')
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
                        data: JSON.stringify(newOrder),
                        url: "/app/createOrder"
                    }).done()
                });
            }
        })
    } else {
        Swal.fire({
            title: 'Bạn có thể order món ăn.',
            icon: 'success'
        }).then(() => {
            $('#modalQuickView').modal('show');
            $.ajax({
                type: "GET",
                url: `/app/getOrder/${tableId}`
            }).done(function (order) {
                alert(order.orderTime)
            })
        })
    }
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