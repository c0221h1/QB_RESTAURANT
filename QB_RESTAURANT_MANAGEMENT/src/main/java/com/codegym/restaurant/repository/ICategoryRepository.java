package com.codegym.restaurant.repository;

import com.codegym.restaurant.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ICategoryRepository extends JpaRepository<Category, Long> {

    @Modifying
    @Query("select c from Category c where c.categoryName = ?1")
    Optional<Category> findCategoryByCategoryName(String categoryName);
<<<<<<< HEAD

=======
>>>>>>> 8c604e44383d00fbd0295616e57c35a2091ab4aa
}
