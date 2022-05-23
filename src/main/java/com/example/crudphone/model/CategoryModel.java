package com.example.crudphone.model;

import com.example.crudphone.entity.Category;

import java.util.List;

public interface CategoryModel {
    Category save(Category obj); // lưu thông tin.

    List<Category> findAll();

    Category findById(int id);

    Category update(int id, Category updateObj);

    boolean delete(int id);
}
