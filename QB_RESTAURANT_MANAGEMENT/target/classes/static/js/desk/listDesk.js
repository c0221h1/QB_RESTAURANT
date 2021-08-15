function getAllDesk(){
    $.ajax({
        type: "GET",
        url: "/allDesk"
    }).done(function (desks){
        let content = "";
        for (let i = 0; i < desks.length; i++) {
            content += `
                        <tr id="row${desks[i].tableId}" class="text-center">
                              <input hidden id="${desks[i].tableId}">
                              <td>${desks[i].tableName}</td>
                              ${desks[i].custom ?
<<<<<<< HEAD
                              '<td style="color: darkred">Bàn đang có khách</td><td>Bàn đang có khách</td>' :
                              `<td style="color: darkblue">Bàn đang trống</td>
                              ${!desks[i].hidden ?
                              `${desks[i].book!= null ?
                                `<td><a onclick="showBookDesk(${desks[i].tableId})" class="btn btn-danger">Đặt bàn ${desks[i].book}</a></td>` :
                                `<td><a onclick="showBookDesk(${desks[i].tableId})" class="btn btn-primary">Đặt bàn</a></td>`}` :
=======
                              '<td style="color: darkred">Bàn đang có khách</td><td><button class="btn btn-warning" title="Tạm thời không thể đặt">Đã có khách</button></td>' :
                              `<td style="color: darkblue">Bàn đang trống</td>
                              ${!desks[i].hidden ?
                              `${desks[i].book!= null && desks[i].book !== (null +"h "+ null) ?
                                `<td><a onclick="showBookDesk(${desks[i].tableId})" class="btn btn-danger">Đặt bàn ${desks[i].book}</a></td>` :
                                `<td><a onclick="showBookDesk(${desks[i].tableId})" class="btn btn-primary">Có thể đặt bàn</a></td>`}` :
>>>>>>> 8c604e44383d00fbd0295616e57c35a2091ab4aa
                                '<td></td>'}`}
                              ${desks[i].hidden ?
                                `<td><a onclick="tableHidden(${desks[i].tableId})" class="btn btn-danger"><i class="fas fa-eye-slash fa-lg"></i></a></td>` :
                                `<td><a onclick="tableHidden(${desks[i].tableId})" class="btn btn-primary"><i class="fas fa-eye fa-lg"></i></a></td>`}                         
                              <td class="text-center">
<<<<<<< HEAD
                                <button class="btn btn-outline-danger delete-button" onclick=deleteDesk(${desks[i].tableId})><i class="fas fa-trash-alt"></i>Xóa</button>
=======
                              ${!desks[i].hidden ?
                                '<button class="btn btn-outline-secondary delete-button" disabled style="text-decoration: line-through"><i class="fas fa-trash-alt"></i>Xóa</button>' :
                                `<button class="btn btn-outline-danger delete-button" onclick=deleteDesk(${desks[i].tableId})><i class="fas fa-trash-alt"></i>Xóa</button>`}
>>>>>>> 8c604e44383d00fbd0295616e57c35a2091ab4aa
                              </td>
                        </tr>
                `;
        }
        $("#deskList tbody").html(content);
    })
}
getAllDesk();
function showModalDesk() {
    $('#deskModal').modal('show')
}
function showBookDesk(tableId) {
    $.ajax({
        type: "GET",
        //tên API
        url: `/tableBook/${tableId}`,
        //xử lý khi thành công
        success: function (desk) {
            $('#upTableId').val(desk.tableId);
            $('#nameTable').text(desk.tableName);
            $('#upTableCustom').val(desk.custom);
<<<<<<< HEAD
            $('#upTimeBook').val(desk.book);
=======
            let times = desk.book.split("h ");
            $('#upTimeBook').val(times[0]);
            $('#upMinuteBook').val(times[1]);
>>>>>>> 8c604e44383d00fbd0295616e57c35a2091ab4aa
            $('#upTableHidden').val(desk.hidden);
            $('#upTableName').val(desk.tableName);
        }
    });
    $('#deskBook').modal('show');
}

$("#create-button").on("click",createDesk);

function createDesk(){
    let tableName = $("#tableName").val();
    let newDesk = {tableName}
    $.ajax({
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        type: "POST",
        data: JSON.stringify(newDesk),
        url: "/createDesk"
    }).done(function (desk){
        $('#deskModal').modal('hide');
        $("#deskForm")[0].reset();
        App.showSuccessAlert("Thêm mới bàn ăn thành công!!");
        $('#deskList tbody').prepend(' <tr id="row'+desk.tableId+'" class="text-center">\n' +
            ' <input hidden id="'+desk.tableId+'">\n' +
            ' <td>'+ desk.tableName + '</td>\n' +
            (desk.custom ?
            ' <td>Bàn đang có khách</td>\n' :
            ' <td>Bàn đang trống</td>\n') +
            ' <td></td>\n' +
            (desk.hidden ?
            '<td><a onclick="tableHidden('+ desk.tableId +')" class="btn btn-danger"><i class="fas fa-eye-slash fa-lg"></i></a></td>' :
            '<td><a onclick="tableHidden('+ desk.tableId +')" class="btn btn-primary"><i class="fas fa-eye fa-lg"></i></a></td>') +
            ' <td class="text-center">\n'+
            ' <button class="btn btn-outline-danger delete-button" onclick="deleteDesk('+desk.tableId+')"><i class="fas fa-trash-alt"></i>Xóa</button>\n' +
            ' </td>\n' +
            ' </tr>');
    }).fail(()=>{
        App.showErrorAlert("Lỗi ! Tên bàn đã tồn tại!!");
    })
}

function deleteDesk(tableId) {
    $.ajax({
        type : "DELETE",
        url : `/desk/${tableId}`
    }).done(function (){
        $("#row" + tableId).remove();
        App.showSuccessAlert("Đã xóa thành công!")
    }).fail(function (){
        App.showErrorAlert("Đã xảy ra lỗi!")
    })
}

function tableHidden(tableId) {
    $.ajax({
        type : "PUT",
        url : `/tableHidden/${tableId}`
    }).done(function (){
        getAllDesk();
        App.showSuccessAlert("Đã thay đổi thành công!")
    }).fail(function (){
        App.showErrorAlert("Đã xảy ra lỗi!")
    })
}

function tableBook() {
    let tableId = $("#upTableId").val();
    let tableName = $("#upTableName").val();
    let custom = $("#upTableCustom").val();
<<<<<<< HEAD
    let timeBook = $("#upTimeBook").val();
=======
    let timeBook = ($("#upTimeBook").val() + "h " + $("#upMinuteBook").val());
>>>>>>> 8c604e44383d00fbd0295616e57c35a2091ab4aa
    let tableHidden = $("#upTableHidden").val();
    let newDesk = {
        tableName : tableName,
        custom : custom,
        book : timeBook,
        hidden : tableHidden
    }
    $.ajax({
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        type : "PUT",
        data: JSON.stringify(newDesk),
        url : `/tableBook/${tableId}`
    }).done(function (){
        $('#deskBook').modal('hide');
        getAllDesk();
        App.showSuccessAlert("Đã đặt thành công!")
    }).fail(function (){
        App.showErrorAlert("Đã xảy ra lỗi!")
    });
}

function resetBook() {
    $('#upTimeBook').val(null);
<<<<<<< HEAD
=======
    $('#upMinuteBook').val(null);
>>>>>>> 8c604e44383d00fbd0295616e57c35a2091ab4aa
}

function getAllDeskDisplay(){
    $.ajax({
        type: "GET",
        url: "/allDesk"
    }).done(function (desks){
        let content = "";
        for (let i = 0; i < desks.length; i++) {
<<<<<<< HEAD
            content += `<div class="table-container" style="float: left; width: 25%; margin-bottom: 5%">
=======
            content += `<div class="table-container" style="float: left; width: 20%; margin-bottom: 5%">
>>>>>>> 8c604e44383d00fbd0295616e57c35a2091ab4aa
                            ${desks[i].hidden ?
                            '' :
                            `<div class="table-infor">
                                <div class="table-img" style="margin-left: 15%">
<<<<<<< HEAD
                                    <div class="table-name"><p>${desks[i].tableName}
                                    ${desks[i].book ?
                                        `<span class="book" style="color: red"> (Bàn đã đặt ${desks[i].book})</span>` :
                                        ''}
                                    </p></div>
                                    ${desks[i].custom ?
                                        '<img src="/uploads/table/table1.jpg" style="width: 60%">' :
                                        '<img src="/uploads/table/table2.jpg" style="width: 60%">'}
=======
                                    <div class="table-name"><p style="color: darkblue">${desks[i].tableName}
                                    ${desks[i].book && desks[i].book !== (null +"h "+ null) ?
                                        `<span class="book" style="color: red"> (Đặt lúc ${desks[i].book})</span>` :
                                        ''}
                                    </p></div>
                                    ${desks[i].custom ?
                                        '<img src="/uploads/table/table1.jpg" style="width: 70%">' :
                                        '<img src="/uploads/table/table2.jpg" style="width: 70%">'}
>>>>>>> 8c604e44383d00fbd0295616e57c35a2091ab4aa
                                </div>
                            </div>`}
                        </div>`
        }
        $("#showDisplay").html(content);
    });
}

getAllDeskDisplay();