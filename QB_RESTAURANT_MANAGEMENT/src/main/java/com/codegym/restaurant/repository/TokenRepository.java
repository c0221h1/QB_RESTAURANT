<<<<<<< HEAD
package com.codegym.restaurant.repository;

import com.codegym.restaurant.model.Token;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TokenRepository extends JpaRepository<Token, Long> {

    Token findByToken(String token);
}
=======
package com.codegym.restaurant.repository;

import com.codegym.restaurant.model.Token;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TokenRepository extends JpaRepository<Token, Long> {

    Token findByToken(String token);
}
>>>>>>> 8c604e44383d00fbd0295616e57c35a2091ab4aa
