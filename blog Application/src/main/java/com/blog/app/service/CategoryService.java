package com.blog.app.service;

import com.blog.app.Model.Category;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CategoryService {
    List<Category> getAllCategory();

    Category addCategory(Category category);

    Category getCategory(int categoryId);
}
