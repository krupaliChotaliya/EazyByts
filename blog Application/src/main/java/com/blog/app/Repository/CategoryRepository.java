package com.blog.app.Repository;

import com.blog.app.Model.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<Category,Integer> {

    @Query(value = "SELECT * FROM category WHERE id = :categoryId", nativeQuery = true)
    Category getCategory(int categoryId);
}
