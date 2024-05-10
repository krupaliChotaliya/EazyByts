package com.blog.app.Repository;

import com.blog.app.Model.Blog;
import com.blog.app.Model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BlogRepository extends JpaRepository<Blog,Integer> {

    @Query(value = "SELECT * FROM blog WHERE user_user_id = :userId", nativeQuery = true)
    List<Blog> getAllBlogsByUserId(int  userId);

    @Query(value = "SELECT b.* FROM blog b INNER JOIN users u ON b.user_user_id = u.user_id INNER JOIN category c ON b.category_id_id = c.id WHERE b.content LIKE %:keyword% OR b.title LIKE %:keyword% OR u.username LIKE %:keyword% OR c.name LIKE %:keyword%",nativeQuery = true )
    List<Blog> findByTitleContainingOrContentContaining(String keyword);
}
