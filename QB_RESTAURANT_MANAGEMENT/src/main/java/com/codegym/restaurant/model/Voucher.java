package com.codegym.restaurant.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.Date;

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
    
    @Temporal(TemporalType.DATE)
    @FutureOrPresent
    private Date beginDate;

    @Column(nullable = false)
    private boolean status;


    private String note;
    
    @Temporal(TemporalType.DATE)
    @Future
    private Date endDate;
}
