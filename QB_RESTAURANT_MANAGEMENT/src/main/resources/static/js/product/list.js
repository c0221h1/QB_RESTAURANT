let singleUploadForm = document.querySelector('#singleUploadForm');
let singleFileUploadInput = document.querySelector('#singleFileUploadInput');

function uploadSingleFile(file) {
    let formData = new FormData();
    formData.append("file", file);

    let xhr = new XMLHttpRequest();
    xhr.open("POST", "/uploadFile");
    xhr.send(formData);
}

$("#singleUploadForm").on("submit",function (){
    let files = singleFileUploadInput.files;
    $("#imageName").val(files[0].name);
    uploadSingleFile(files[0]);
})

function getAllCategory(){
    $.ajax({
        type: "GET",
        url: "/allCategory"
    }).done(function (category){
        let content = "";
        for (let i = 0; i < category.length; i++) {
            content += `
                    <option value="${category[i].categoryId}">${category[i].categoryName}</option>
                `;
        }
        $("#category").html(content);
    })
}

function getAllProduct(){
    $.ajax({
        type: "GET",
        url: "/allProduct"
    }).done(function (product){
        let content = "";
        for (let i = product.length-1; i >= 0; i--) {
            content += `
                        <tr id="row${product[i].productId}" class="text-center">
                              <input hidden id="${product[i].productId}">
                              <td>${product[i].productName}</td>
                              <td><img style="object-fit: cover"  width="100" height="100" src= "/uploads/${product[i].image}"  alt="${product[i].productName}"></td>
                              <td>${product[i].price + " VND"}</td>
                              <td>${product[i].category.categoryName}</td>
                              <td class="text-center">
                                <button value="${product[i].productId}" class="btn btn-outline-primary mr-2 edit-button" ><i class="far fa-edit"></i>Sửa</button>
                                <button value="${product[i].productId}" class="btn btn-outline-danger delete-button" onclick="deleteProduct()" ><i class="fas fa-trash-alt"></i>Xóa</button>
                              </td>
                        </tr>
                `;
        }
        $("#productList tbody").html(content);
    })
}

getAllCategory();

getAllProduct();

function showModal() {
    $('#productModal').modal('show')
}

function createProduct(){
    let files = singleFileUploadInput.files;
    $("#imageName").val(files[0].name);
    uploadSingleFile(files[0]);

    let product_id = $('#productId').val();
    let product_name = $("#product_name").val();
    let image = $("#imageName").val();
    let price = $("#price").val();
    let category = $("#category").val();
    let description = $("#description").val();

    let newCategory = {
        categoryId : category
    }

    let newProduct = {
        productId : product_id,
        productName : product_name,
        image : image,
        price : price,
        category : newCategory,
        description : description
    }
    if ($("#create-form").valid()){
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            type: "POST",
            data: JSON.stringify(newProduct),
            url: "/createProduct"
        }).done(function (product){
            $("#create-form")[0].reset();
            App.showSuccessAlert("Thêm mới sản phẩm thành công!!");
            $('#productList tbody').prepend(' <tr id="row'+product.productId+'" class="text-center">\n' +
                ' <input hidden id="'+product.productId+'">\n' +
                ' <td>'+ product.productName + '</td>\n' +
                ' <td><img style="object-fit: cover"  width="100" height="100" src= "/uploads/product.image"  alt="'+product.productName+'"></td>\n' +
                ' <td>'+ product.price + " VND" + '</td>\n' +
                ' <td>'+ product.category.categoryName + '</td>\n' +
                ' <td class="text-center">\n'+
                ' <button value="'+product.productId +'" class="btn btn-outline-primary mr-2 edit-button" ><i class="far fa-edit"></i>Sửa</button>\n' +
                ' <button value="'+product.productId +'" class="btn btn-outline-danger delete-button"><i class="fas fa-trash-alt"></i>Xóa</button>\n' +
                ' </td>\n' +
                ' </tr>');
        }).fail(()=>{
            App.showErrorAlert("Đã xảy ra lỗi!");
        })
    }
}

$("#create-button").on("click",createProduct);

function showModalCategory() {
    $('#categoryModal').modal('show')
}

function deleteProduct(productID) {
    $.ajax({
        type : "DELETE",
        url : `/${productID}`
    }).done(function (){
        $("#row" + productID).remove();
        App.showSuccessAlert("Đã xóa thành công!")
    }).fail(function (){
        App.showErrorAlert("Đã xảy ra lỗi!")
    })
}

$(".delete-button").on("click",deleteProduct);


