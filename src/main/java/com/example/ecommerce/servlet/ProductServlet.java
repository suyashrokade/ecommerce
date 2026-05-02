package com.example.ecommerce.servlet;

import com.example.ecommerce.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/products")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = new ArrayList<>();
        products.add(new Product("P001", "Wireless Mouse", 24.99));
        products.add(new Product("P002", "Mechanical Keyboard", 79.99));
        products.add(new Product("P003", "USB-C Charger", 19.99));
        products.add(new Product("P004", "Noise Cancelling Headphones", 129.99));

        req.setAttribute("products", products);
        req.getRequestDispatcher("/products.jsp").forward(req, resp);
    }
}
