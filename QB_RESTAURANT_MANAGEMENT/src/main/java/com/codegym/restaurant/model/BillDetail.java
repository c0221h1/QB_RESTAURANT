package com.codegym.restaurant.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "billDetails")
public class BillDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long billDetailId;

    @OneToOne
    @JoinColumn(name = "orderDetail_Id")
    private OrderDetail orderDetail;

    @ManyToOne
    @JoinColumn(name = "bill_Id")
    private Bill bill;
}
