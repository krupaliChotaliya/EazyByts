package com.blog.app.controller;


import com.blog.app.Model.Category;
import com.blog.app.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.List;

@Controller
@ControllerAdvice
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/categories")
    public List<Category> getAllCategory(){
        return categoryService.getAllCategory();
    }

    @GetMapping("/category")
    public String getCategory(Model model){
        Category category = new Category();
        model.addAttribute("category", category);
        return "addCategory";
    }

    @PostMapping("/category")
    public String addCategory(@Valid Category category, BindingResult bindingResult, Model model){
        categoryService.addCategory(category);
        if (bindingResult.hasErrors()) {
            model.addAttribute("message", "please provide required data!!");
            return "addCategory";
        }
        try {
            model.addAttribute("message", "Successfully added Category!!");
            return "redirect:/dashboard/category";
        } catch (Exception e) {
            model.addAttribute("message", e.getMessage());
            return "addCategory";
        }
    }

    @ModelAttribute("categories")
    public List<Category> populateCategories() {
        return categoryService.getAllCategory();
    }

}
