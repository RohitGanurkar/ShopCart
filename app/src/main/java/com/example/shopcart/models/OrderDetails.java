package com.example.shopcart.models;

public class OrderDetails {
    String productName;
    int amount;
    double price;
    Long created_at;

    public OrderDetails(String productName, int amount, double price, Long created_at) {
        this.productName = productName;
        this.amount = amount;
        this.price = price;
        this.created_at = created_at;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Long getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Long created_at) {
        this.created_at = created_at;
    }
}
