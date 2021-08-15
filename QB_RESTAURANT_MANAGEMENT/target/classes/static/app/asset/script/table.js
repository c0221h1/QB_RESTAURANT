class table {
    constructor(name, status, book) {
        this.name = name;
        this.status = status;
        this.book = book;
    }
}
let tableShow = [];
let table1 = new table(1, true, false);
let table2 = new table(2, true, true);
let table3 = new table(3, false, false);
let table4 = new table(4, false, false);
let table5 = new table(5, false, false);
let table6 = new table(6, true, false);
let table7 = new table(7, true, false);
let table8 = new table(8, true, false);
let table9 = new table(9, false, false);
let table10 = new table(10, false, false);
let table11 = new table(11, false, false);
let table12 = new table(12, true, true);

tableShow = [table1, table2, table3, table4, table5, table6, table7, table8, table9, table10, table11, table12];
let show = document.getElementById("show");
show.innerHTML = "";
tableShow.forEach(function(item) {
    show.innerHTML += `<div class="table-container">
                            <div class="table-infor">
                                <div class="table-img">
                                    <div class="table-name"><p>${item.name}</p></div>
                                    ${item.book ?
                                        '<div class="book"><p>Đặt</p></div>' :
                                        ''}
                                    ${item.status ?
                                    '<img src="/app/asset/img/table1.jpg">' :
                                    '<img src="/app/asset/img/table2.jpg">'}
                                    <div class="portfolio-info">
                                        <h4>Table ${item.name}</h4>
                                        ${item.status ?
                                        '<p style="color: blue; font-weight:bold;">Empty</p>' :
                                        '<p style="color: red; font-weight:bold;">Exist</p>'}
                                        <div class="portfolio-links">
                                            <a href="#" data-toggle="modal" data-target="#modalQuickView"><i class="fas fa-eye fa-sm"></i></a>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>`
});


// jQuery('#modalQuickView').modal('show').on('hide.bs.modal', function(e){
//     e.preventDefault();
// })

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