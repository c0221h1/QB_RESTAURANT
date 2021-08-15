<<<<<<< HEAD
package com.codegym.restaurant.service.category;

import com.codegym.restaurant.model.Category;
import com.codegym.restaurant.service.IGeneralService;

import java.util.Optional;

public interface ICategoryService  extends IGeneralService<Category> {

    Optional<Category> findCategoryByCategoryName(String categoryName);
}
=======
package com.codegym.restaurant.service.category;

import com.codegym.restaurant.model.Category;
import com.codegym.restaurant.service.IGeneralService;

import java.util.Optional;

public interface ICategoryService  extends IGeneralService<Category> {

    Optional<Category> findCategoryByCategoryName(String categoryName);
}
>>>>>>> 8c604e44383d00fbd0295616e57c35a2091ab4aa
