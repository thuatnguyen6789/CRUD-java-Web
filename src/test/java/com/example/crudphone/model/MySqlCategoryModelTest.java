package com.example.crudphone.model;

import com.example.crudphone.entity.Category;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class MySqlCategoryModelTest {
    private MySqlCategoryModel model;

    @BeforeEach
    void setUp() {
        model = new MySqlCategoryModel();
    }
    @Test
    public void create(){
        Category category = new Category();
        category.setName("Lon cap nach");
        model.save(category);
        Category category2 = new Category();
        category2.setName("Lon nai");
        model.save(category2);
        assertEquals(2, model.findAll().size());
    }
    @Test
    public void update(){
       Category category = model.findById(2);
       assertNotEquals(null, category);
    }
    @Test
    public void delete(){
        model.delete(2);
        assertNotEquals(2, model.findAll().size());
    }
}