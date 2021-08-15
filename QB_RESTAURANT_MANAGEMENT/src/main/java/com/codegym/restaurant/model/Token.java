<<<<<<< HEAD
package com.codegym.restaurant.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "tokens")
@Getter
@Setter
public class Token extends BaseEntity {

    @Column(length = 1000)
    private String token;

    private Date tokenExpDate;

}
=======
package com.codegym.restaurant.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "tokens")
@Getter
@Setter
public class Token extends BaseEntity {

    @Column(length = 1000)
    private String token;

    private Date tokenExpDate;

}
>>>>>>> 8c604e44383d00fbd0295616e57c35a2091ab4aa
