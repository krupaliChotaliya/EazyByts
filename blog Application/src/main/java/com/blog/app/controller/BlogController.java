package com.blog.app.controller;

import com.blog.app.Model.Blog;
import com.blog.app.Model.User;
import com.blog.app.service.BlogService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.Optional;

@Controller
public class BlogController {

    @Autowired
    private BlogService blogService;

    @Autowired
    private UserController userController;

    @GetMapping("/blog")
    public String getAddBLogPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        if (userId == null) {
            model.addAttribute("error", "You are not logged in!!");
            return "login";
        }
        Blog blog = new Blog();
        model.addAttribute("blog", blog);
        return "addBlog";
    }

    @PostMapping("/blog")
    public String createBlog(@Valid Blog blog, BindingResult bindingResult, @RequestParam("imagePath") MultipartFile image, RedirectAttributes redirectAttributes, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        User user = userController.getUserByEmail(userId);
        blog.setUser(user);

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("message", "Please provide required data!!");
            return "redirect:/blog";
        }
        try {
            blogService.createBlog(blog, image);
            redirectAttributes.addFlashAttribute("message", "Successfully added blog!!");
            return "redirect:/blog";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Something went wrong!!");
            return "redirect:/blog";
        }
    }

    @GetMapping("/image/{imageName}")
    public void getImage(@PathVariable String imageName, HttpServletResponse response) throws IOException {
        Resource resource = new ClassPathResource("Images/" + imageName);
        InputStream inputStream = resource.getInputStream();
        String contentType = "image/jpeg";
        response.setContentType(contentType);
        try (OutputStream outputStream = response.getOutputStream()) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }
    }

    @GetMapping("/blog/myblog")
    public String myblog(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        if (userId == null) {
            model.addAttribute("error", "You are not logged in!!");
            return "login";
        }
        User user = userController.getUserByEmail(userId);

        List<Blog> blogs = blogService.getAllBlogsByUserId(user.getUserId());
        model.addAttribute("blogs", blogs);
        return "MyBlog";
    }

    @PostMapping("/blogs/update")
    public String updateBlog(@Valid Blog blog, BindingResult bindingResult, @RequestParam("imagePath") MultipartFile image, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        User user = userController.getUserByEmail(userId);
        blog.setUser(user);
        if (bindingResult.hasErrors()) {
            model.addAttribute("message", "please provide required data!!");
            return "redirect:/blog/myblog";
        }
        try {
            blogService.updateBlog(image, blog, blog.getId());
            model.addAttribute("message", "Successfully Updated blog!!");
            return "redirect:/blog/myblog";
        } catch (Exception e) {
            model.addAttribute("message", "Something went wrong!!");
            return "redirect:/blog/myblog";
        }
    }

    @GetMapping("/blogs/update")
    public String updateBlog(@RequestParam int blogId, Model model) {
        Optional<Blog> blog = blogService.getBlogBYBlogID(blogId);
        if (blog.isPresent()) {
            model.addAttribute("blog", blog);
        } else {
            Blog blog1 = new Blog();
            model.addAttribute("blog", blog1);
        }
        return "UpdateBlog";
    }

    @GetMapping("/blogs/delete/{blogId}")
    public String deleteBlog(@PathVariable("blogId") int blogId) {
        blogService.deleteBlog(blogId);
        return "redirect:/blog/myblog";
    }

    @PostMapping("/blogs/search")
    public String searchBlogs(@RequestParam String keyword, Model model) {
        List<Blog> searchResults = blogService.searchBlogs(keyword);
        model.addAttribute("blogs", searchResults);
        return "index";
    }

    @GetMapping("/blogs/blog/{blogId}")
    public String getBlog(@PathVariable("blogId") int blogId, Model model) {
        Optional<Blog> blog = blogService.getBlogBYBlogID(blogId);
        String twitterLink = "https://twitter.com/intent/tweet?url=" +
                URLEncoder.encode("http://localhost:8080/blogs/blog/" + blogId, StandardCharsets.UTF_8);
        String linkedInLink = "https://www.linkedin.com/sharing/share-offsite/?url=" +
                URLEncoder.encode("http://localhost:8080/blogs/blog/" + blogId, StandardCharsets.UTF_8);
        model.addAttribute("linkedInLink", linkedInLink);
        model.addAttribute("twitterLink", twitterLink);
        model.addAttribute("blog", blog);
        return "Blog";
    }

    @GetMapping("/blogs")
    public List<Blog> getAllBlogs() {
        return blogService.getAllBlogs();
    }
}