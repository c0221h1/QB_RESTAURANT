$(() => {
    $("#create-form").validate({
        errorElement: 'div',
        rules: {
            product_name:  {
                required: true,
                minlength: 2,
                maxlength: 50,
            },
            price: {
                required: true,
                min: 1000,
                max: 100000000
            },
            description:{
                required:true
            },
        },
        messages: {
            product_name: {
                required: "Vui lòng nhập tên sản phẩm",
                minlength: "Vui lòng nhập tối thiểu 2 ký tự!",
                maxlength: "Vui lòng nhập tối đa chỉ có 50 ký tự!"
            },
            price: {
                required: "Vui lòng nhập giá!",
                min: "Nhỏ nhất là 1000 VND !!",
                max: "Lớn nhất là 100000000 VND!!"
            },
            description:{
                required:"Vui lòng nhập mô tả!"
            },
        },
        submitHandler: function() {
            createProduct();
        }
    });

    $("#voucherForm").validate({
        errorElement: 'div',
        rules: {
            voucherName:  {
                required: true,
                minlength: 3,
                maxlength: 255,
            },
            percent: {
                required: true,
                min: 1,
                max: 100
            },
            beginDate:{
                required:true,
                min: Date.now(),
            },
            endDate:{
                required: true,
                min: Date.now(),
            },

        },
        messages: {
            product_name: {
                required: "Tên khuyến mãi không để trống ",
                minlength: "Vui lòng nhập tối thiểu 3 ký tự!",
                maxlength: "Vui lòng nhập tối đa chỉ có 255 ký tự!"
            },
            price: {
                required: "Vui lòng nhập phần trăm khuyến mãi",
                min: "Nhỏ nhất là 1%",
                max: "Lớn nhất là 100%"
            },
            beginDate:{
                required:"Ngày bắt đầu khuyến mãi là bắt buộc",
                min:"Khuyến mãi không thể bắt đầu trong quá khứ"
            },
            endDate:{
                required:"Ngày kết thúc khuyến mãi là bắt buộc",
                min:"Không thể đặt kết thúc khuyến mãi trong quá khứ"
            },
        },
        submitHandler: function() {
            createProduct();
        }
    });
});
