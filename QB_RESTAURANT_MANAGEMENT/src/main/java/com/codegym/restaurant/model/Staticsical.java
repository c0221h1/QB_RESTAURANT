package com.codegym.restaurant.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "staticsicals")
public class Staticsical {
    @Id
    @Size(min = 4, max = 5)
    @Min(2020)
    private Long year;

    private Double total;

    private  Double jan;

    private Double feb;

    private Double mar;

    private Double apr;

    private Double may;

    private Double jun;

    private Double jul;

    private Double aug;

    private Double sep;

    private Double oct;

    private Double nov;

    private Double dec;
}
