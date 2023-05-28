package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cart {
    private Map<String, Integer> items; // Map to store product IDs and quantities

    public Cart() {
        items = new HashMap<>();
    }

    public void addItem(String productId, int quantity) {
        // Add the product to the cart or update its quantity if it already exists
        items.put(productId, items.getOrDefault(productId, 0) + quantity);
    }

    public void removeItem(String productId) {
        // Remove the product from the cart
        items.remove(productId);
    }

    public List<String> getItems() {
        // Return a list of product IDs in the cart
        return new ArrayList<>(items.keySet());
    }

    public int getQuantity(String productId) {
        // Return the quantity of a specific product in the cart
        return items.getOrDefault(productId, 0);
    }

    public void clearCart() {
        // Clear the cart by removing all items
        items.clear();
    }
}
