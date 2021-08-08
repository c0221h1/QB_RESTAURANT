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
                              <td>${desks[i].custom}</td>
                              <td>${desks[i].book}</td>
                              <td>${desks[i].hidden}</td>                          
                              <td class="text-center">
                                <button value="${desks[i].tableId}" class="btn btn-outline-primary mr-2 edit-button" ><i class="far fa-edit"></i>Sửa</button>
                                <button value="${desks[i].tableId}" class="btn btn-outline-danger delete-button" ><i class="fas fa-trash-alt"></i>Xóa</button>
                              </td>
                        </tr>
                `;
        }
        $("#deskList tbody").html(content);
    })
}
getAllDesk();