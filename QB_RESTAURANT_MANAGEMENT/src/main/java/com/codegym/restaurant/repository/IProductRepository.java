package com.codegym.restaurant.repository;

import com.codegym.restaurant.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface IProductRepository extends JpaRepository<Product, Long> {

    @Query("select p from Product p where p.status = true")
    Iterable<Product> findAllByOrderByProductIdDesc();

    @Modifying
    @Query("update Product p set p.status = false where p.productId = :id")
    void deleteProductById(@Param("id") Long id);

    @Query("select p from Product p where p.status = false order by p.productId desc ")
    Iterable<Product> findAllByOrderByProductHiddenDesc();


    @Modifying
    @Query("update Product p set p.status = true where p.productId = :id")
    void restoreProductById(@Param("id") Long id);

    Optional<Product> findByProductName(String productName);
<<<<<<< HEAD

    @Query("select p from Product p where p.category.categoryId = ?1")
    Iterable<Product> findAllByCategoryCategory_id(Long id);

=======
<<<<<<< HEAD

    @Query("select p from Product p where p.category.categoryId = ?1")
    Iterable<Product> findAllByCategoryCategory_id(Long id);
=======
>>>>>>> 0d269341e8c2ce1d25b49115a1594937f71c5b1a
    
>>>>>>> 8c604e44383d00fbd0295616e57c35a2091ab4aa
    @Modifying
    @Query("SELECT count (p) FROM Product  p where p.status = true group by  p.productId")
    int countProduct();
    
    int countByStatusTrue();
}
