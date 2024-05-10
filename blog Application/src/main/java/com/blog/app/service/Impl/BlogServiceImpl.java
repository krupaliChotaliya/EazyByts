package com.blog.app.service.Impl;

import com.blog.app.Model.Blog;
import com.blog.app.Repository.BlogRepository;
import com.blog.app.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class BlogServiceImpl implements BlogService {

    @Autowired
    private BlogRepository blogRepository;

    @Override
    public void createBlog(Blog blog, MultipartFile image) throws Exception {
        try {
            String imageName = storeImage(image);
            blog.setImage(imageName);
            blog.setCreatedAt(new Date());
            blog.setUpdatedAt(new Date());
            blogRepository.save(blog);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error" + e.getMessage());
        }
    }

    private String storeImage(MultipartFile image) throws Exception {
        String folderPath = "./src/main/resources/Images/";
        byte[] bytes = image.getBytes();
        Path path = Paths.get(folderPath + image.getOriginalFilename());
        Files.write(path, bytes);
        return image.getOriginalFilename();
    }

    public List<Blog> getAllBlogs() {
        return blogRepository.findAll();
    }

    @Override
    public List<Blog> getAllBlogsByUserId(int userId) {
        return blogRepository.getAllBlogsByUserId(userId);
    }

    @Override
    public Blog updateBlog(MultipartFile image, Blog updatedBlog, long blogId) {
        Blog blog = blogRepository.findById((int) blogId).orElse(null);
        System.out.println(blog.getContent());
        try {
            String imageName = storeImage(image);
            blog.setTitle(updatedBlog.getTitle());
            blog.setContent(updatedBlog.getContent());
            blog.setImage(imageName);
            blog.setCategoryId(updatedBlog.getCategoryId());
            blog.setUpdatedAt(new Date());
            blogRepository.save(blog);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error" + e.getMessage());
        }
        return blog;
    }

    @Override
    public Optional<Blog> getBlogBYBlogID(int blogId) {
        return blogRepository.findById(blogId);
    }
    @Override
    public void deleteBlog(int blogId) {
        blogRepository.deleteById(blogId);
    }

    @Override
    public List<Blog> searchBlogs(String keyword) {
        return blogRepository.findByTitleContainingOrContentContaining(keyword);
    }
}
