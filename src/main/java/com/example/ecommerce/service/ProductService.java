package com.example.ecommerce.service;

import com.example.ecommerce.model.Product;
import java.util.ArrayList;
import java.util.List;

public class ProductService {
    private static final List<Product> PRODUCTS = new ArrayList<>();

    static {
        PRODUCTS.add(new Product("P001", "Wireless Mouse", 24.99));
        PRODUCTS.add(new Product("P002", "Mechanical Keyboard", 79.99));
        PRODUCTS.add(new Product("P003", "USB-C Charger", 19.99));
        PRODUCTS.add(new Product("P004", "Noise Cancelling Headphones", 129.99));
        PRODUCTS.add(new Product("P005", "4K Webcam", 99.99));
        PRODUCTS.add(new Product("P006", "LED Desk Lamp", 34.99));
        PRODUCTS.add(new Product("P007", "Gaming Mouse Pad", 24.99));
        PRODUCTS.add(new Product("P008", "USB Hub 7-Port", 29.99));
    }

    public static List<Product> getAllProducts() {
        return new ArrayList<>(PRODUCTS);
    }

    public static Product getProductById(String id) {
        return PRODUCTS.stream()
                .filter(p -> p.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

    public static double calculateCartTotal(List<Product> cart) {
        return cart.stream()
                .mapToDouble(Product::getPrice)
                .sum();
    }
}
