package com.codegym.restaurant.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.sql.Date;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "bills")
public class Bill {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long billId;

    @Column(nullable = false)
    private Date billTime;

    @Size(min = 0, max = 2147483000)
    private  int vat;

    @Column(nullable = false)
    private boolean status;

    @OneToOne
    @JoinColumn(name = "order_Id")
    private Order order;

    @OneToMany(targetEntity = BillDetail.class, fetch = FetchType.EAGER)
    private List<BillDetail> billDetailList;
}
