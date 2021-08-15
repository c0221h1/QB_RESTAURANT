<<<<<<< HEAD
package com.codegym.restaurant.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Set;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "positions")
public class Position {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long positionId;

    private String code;

    @Column (nullable = false)
    @Size(min = 1, max = 100)
    private String positionName;

    @OneToMany(targetEntity = Employee.class, fetch = FetchType.EAGER)
    private Set<Employee> employees;

}
=======
package com.codegym.restaurant.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Set;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "positions")
public class Position {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long positionId;

    private String code;

    @Column (nullable = false)
    @Size(min = 1, max = 100)
    private String positionName;

    @OneToMany(targetEntity = Employee.class, fetch = FetchType.EAGER)
    private Set<Employee> employees;

}
>>>>>>> 8c604e44383d00fbd0295616e57c35a2091ab4aa
