package com.example.crudphone.model;

import com.example.crudphone.entity.Product;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class MySqlProductModelTest {
    private ProductModel productModel;
    @BeforeEach
    void setUp() {
        productModel = new MySqlProductModel();
    }

    @Test
    public void create() {
        Product product = new Product();
        product.setCategoryId(2);
        product.setName("Lon cap nach 01");
        product.setPrice(100000);
        product.setDescription("Loren ipsum");
        product.setDetail("Loren ipsum");
        product.setThumbnail("Loren ipsum");
        productModel.save(product);
    }

    @Test
    public void findAll() {
        System.out.println(productModel.findAll().size());
    }

    @Test
    public void findById() {
        System.out.println(productModel.findById(1).toString());
    }
}