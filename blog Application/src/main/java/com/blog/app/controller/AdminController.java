package com.blog.app.controller;

import com.blog.app.Model.Blog;
import com.blog.app.Model.Category;
import com.blog.app.Model.User;
import com.blog.app.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private UserController userController;

    @Autowired
    private CategoryController categoryController;

    @Autowired
    private BlogController blogController;


    @GetMapping("/dashboard/users")
    public String getUsers(Model model) {
        List<User> users = userController.getUsers();
        model.addAttribute("users", users);
        return "Dashboard/users";
    }

    @GetMapping("/dashboard/blogs")
    public String getBlogs(Model model) {
        List<Blog> blogs = blogController.getAllBlogs();
        model.addAttribute("blogs", blogs);
        return "Dashboard/blogs";
    }

    @GetMapping("/dashboard/category")
    public String getCategory(Model model) {
        List<Category> categories = categoryController.getAllCategory();
        model.addAttribute("categories", categories);
        return "Dashboard/category";
    }

}
