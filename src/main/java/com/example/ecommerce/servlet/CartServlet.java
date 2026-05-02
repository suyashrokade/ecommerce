package com.example.ecommerce.servlet;

import com.example.ecommerce.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(urlPatterns = "/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }
        req.setAttribute("cart", cart);
        req.getRequestDispatcher("/cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        if (productId != null && !productId.isEmpty()) {
            Product product = findProduct(productId);
            if (product != null) {
                HttpSession session = req.getSession();
                List<Product> cart = (List<Product>) session.getAttribute("cart");
                if (cart == null) {
                    cart = new ArrayList<>();
                    session.setAttribute("cart", cart);
                }
                cart.add(product);
            }
        }
        resp.sendRedirect(req.getContextPath() + "/cart");
    }

    private Product findProduct(String id) {
        switch (id) {
            case "P001": return new Product("P001", "Wireless Mouse", 24.99);
            case "P002": return new Product("P002", "Mechanical Keyboard", 79.99);
            case "P003": return new Product("P003", "USB-C Charger", 19.99);
            case "P004": return new Product("P004", "Noise Cancelling Headphones", 129.99);
            default: return null;
        }
    }
}
