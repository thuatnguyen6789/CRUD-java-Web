package com.example.crudphone.controller.product;

import com.example.crudphone.entity.Product;
import com.example.crudphone.model.CategoryModel;
import com.example.crudphone.model.MySqlCategoryModel;
import com.example.crudphone.model.MySqlProductModel;
import com.example.crudphone.model.ProductModel;
import com.example.crudphone.util.DateTimeHelper;
import com.example.crudphone.util.ValidationUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;

public class CreateProductServlet extends HttpServlet {

    private ProductModel productModel;
    private CategoryModel categoryModel;

    public CreateProductServlet() {
        this.productModel = new MySqlProductModel();
        this.categoryModel = new MySqlCategoryModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // trả về form.
        req.setAttribute("categories", categoryModel.findAll());
        req.setAttribute("obj", new Product());
        req.setAttribute("action", 1);
        req.getRequestDispatcher("/admin/products/form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        // xử lý validate và save.
        String rollNumber = req.getParameter("rollNumber");
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String stringBirthday = req.getParameter("birthday");
        System.out.println(fullName);
        Product Product = new Product(rollNumber, fullName, email, phone);
        HashMap<String, String> errors = new HashMap<>();
        if (stringBirthday != null && stringBirthday.length() > 0) {
            LocalDateTime birthday = DateTimeHelper.convertStringToLocalDateTime(stringBirthday);
            Product.setDob(birthday);
        }
        // validate dữ liệu theo kiểu cùi bắp.
        if (rollNumber == null || rollNumber.length() == 0) {
            errors.put("rollNumber", "Please enter rollnumber");
        }
        if (fullName == null || fullName.length() == 0) {
            errors.put("fullName", "Please enter fullname");
        }
        if (email == null || email.length() == 0) {
            errors.put("email", "Please enter email");
        } else if (!ValidationUtil.checkEmail(email)) {
            errors.put("email", "Invalid email, please enter real email. For example: admin@gmail.com");
        }
        if (phone == null || phone.length() == 0) {
            errors.put("phone", "Please enter phone");
        }
        if (errors.size() > 0) {
            req.setAttribute("Product", Product);
            req.setAttribute("action", 1);
            req.setAttribute("errors", errors);
            req.getRequestDispatcher("/admin/Products/form.jsp").forward(req, resp);
            return;
        }
        if (ProductModel.save(Product) != null) {
            resp.sendRedirect("/admin/Products/list");
        } else {
            req.getRequestDispatcher("/admin/Products/form.jsp").forward(req, resp);
        }
    }
}
