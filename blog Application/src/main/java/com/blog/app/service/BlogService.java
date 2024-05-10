package com.blog.app.service;

import com.blog.app.Model.Blog;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@Service
public interface BlogService {

    void createBlog(Blog blog, MultipartFile image) throws Exception;

     List<Blog> getAllBlogs();

     List<Blog> getAllBlogsByUserId(int userId);

    Blog updateBlog(MultipartFile image, Blog updatedBlog,long BlogId);

    Optional<Blog> getBlogBYBlogID(int blogId);

    void deleteBlog(int blogId);

    List<Blog> searchBlogs(String keyword);
}
