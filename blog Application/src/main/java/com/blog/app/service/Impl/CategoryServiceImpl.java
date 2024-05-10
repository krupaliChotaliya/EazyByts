package com.blog.app.service.Impl;

import com.blog.app.Model.Category;
import com.blog.app.Repository.CategoryRepository;
import com.blog.app.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;
    @Override
    public List<Category> getAllCategory() {
        return categoryRepository.findAll();
    }

    @Override
    public Category addCategory(Category category) {
        return categoryRepository.save(category);
    }

    @Override
    public Category getCategory(int categoryId) {
        return categoryRepository.getCategory(categoryId);
    }
}
