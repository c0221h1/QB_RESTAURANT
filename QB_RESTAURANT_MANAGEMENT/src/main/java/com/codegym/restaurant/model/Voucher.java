package com.codegym.restaurant.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;
import java.sql.Date;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name= "vouchers")
public class Voucher {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long voucherId;

    @Column(nullable = false)
    @Size(min = 3, max = 255)
    private String voucherName;

    @Min (1)
    @Max(100)
    private int percent;

    @Column(nullable = false)
    @DateTimeFormat
    private Date beginDate;

    @Column(nullable = false)
    private boolean status;


    private String note;

    @Column(nullable = false)
    @DateTimeFormat
    private Date endDate;
}
