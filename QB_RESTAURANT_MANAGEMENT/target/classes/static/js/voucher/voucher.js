
var voucher  = voucher || {};

voucher.voucherList = function(){
    $.ajax({
        url:'/vouchers/all',
        method:'GET',
        success: function(response){
            $('.table-voucher tbody').empty();
            response = response.sort(function(pdt1, pdt2){
                return pdt2.id - pdt1.id;
            })
            $.each(response, function(index, item){
                $('.table-voucher tbody').append(`
                    <tr>     
                        <td>${item.voucherId}</td>
                        <td>${item.voucherName}</td>
                        <td class='text-right'>${item.percent}</td>
                        <td class='text-right'>${item.beginDate}</td>
                        <td class='text-right'>${item.endDate}</td>
                        <td class='text-right'>
                            ${item.status ?
                    '<span class="badge bg-primary">Active</span>' :
                    '<span class="badge bg-danger">Inactive</span>'}
                        </td>
                        <td>
                            <a href='javascript:;' class='btn btn-success btn-sm'
                                title='Modify voucher'
                                onclick="voucher.getVoucher(${item.voucherId})">
                                <i class='fa fa-pencil-alt'></i>
                            </a>
                            <a href='javascript:;' onclick="voucher.confirmChangeStatus(${item.voucherId}, ${item.status})" 
                                class='btn ${item.status ? "btn-warning" : "btn-secondary"} btn-sm'
                                    title='${item.status ? "Inactive voucher" : "Active voucher"}'>
                                    <i class='fa ${item.status ? "fa-lock-open" : "fa-lock"}'></i></a>
                            <a href='javascript:;' class='btn btn-danger btn-sm' title='Remove voucher'
                                onclick="voucher.removeVoucher(${item.voucherId})">
                                <i class='fa fa-trash'></i>
                            </a>
                        </td>
                    </tr>
                    `);
            });
            $('.table-voucher').DataTable({
                columnDefs: [
                    { orderable: false, targets: [6,7] },
                    { searchable: false, targets: [0,6,7] }
                ],
                order: [[0, 'desc']]
            });
        }
    })
};

voucher.save = function (){
    if( $('#voucherForm').valid()){
        let voucherId = parseInt($('input[name=voucherId]').val());
        if( voucherId == 0) {
            let createObj = {};
            createObj.voucherName = $('input[name = voucherName]').val();
            createObj.percent = $('input[name = percent]').val();
            createObj.beginDate = $('input[name = beginDate]').val();
            createObj.endDate = $('input[name = endDate]').val();
            createObj.status = $('input[name = "Active"]').is(":checked");

            $.ajax({
                url: '/vouchers',
                method: "POST",
                contentType:"application/json",
                dataType:"json",
                data: JSON.stringify(createObj),
                success: function (result){
                    if(result){
                        voucher.voucherList();
                        $('#voucherModal').modal('hide');
                        $.notify("Tạo khuyến mãi thành công","succes");
                    }else{
                        $.notify("Xảy ra lỗi, thử lại","error");
                    }
                }
            })
        }else{
            let modifiObj = {};
            modifiObj.voucherName = $('input[name = voucherName]').val();
            modifiObj.percent = $('input[name = percent]').val();
            modifiObj.beginDate = $('input[name = beginDate]').val();
            modifiObj.endDate = $('input[name = endDate]').val();
            modifiObj.status = $('input[name = "Active"]').is(":checked");
            modifiObj.voucherId = voucherId;

            $.ajax({
                url: '/vouchers/${voucherId}',
                method: "PUT",
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify(modifiObj),
                success: function (result){
                    if(result){
                        voucher.voucherList();
                        $('#voucherModal').modal('hide');
                        $.notify("Tạo khuyến mãi thành công","succes");
                    }else{
                        $.notify("Xảy ra lỗi, thử lại","error");
                    }
                }
            })
        }
    }
}

voucher.getVoucher = function (promotionId){
    $.ajax({
        url:'/vouchers/${voucherId}',
        method:"GET",
        success: function (resp){
            $('input[name = voucherName]').val(resp.voucherName);
            $('input[name = percent]').val(resp.percent);
            $('input[name = beginDate]').val(resp.beginDate);
            $('input[name = endDate]').val(resp.endDate);
            $('input[name = "Active"]').prop(":checked", resp.status);

            $('#voucherModal').find('.modal-title').text('Sửa khuyến mãi');
            $('#voucherModal').modal('show');
        }
    })
}

voucher.showModal = function() {
    voucher.reset();
    $('#voucherModal').modal('show')
};

voucher.reset = function(){
    $('#voucherForm').validate().resetForm();
    $('#voucherForm')[0].reset();
    $('#voucherModal').find('.modal-title').text('Tạo khuyến mãi');
}

voucher.init = function(){
    voucher.voucherList();
};

$(document).ready(function(){
    voucher.init();
});