package com.example.shopcart.models;

public class Order {
    int id;
    String code;
    double total_fees;
    Long created_at;

    public Order(int id, String code, double total_fees, Long created_at) {
        this.id = id;
        this.code = code;
        this.total_fees = total_fees;
        this.created_at = created_at;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public double getTotal_fees() {
        return total_fees;
    }

    public void setTotal_fees(double total_fees) {
        this.total_fees = total_fees;
    }

    public Long getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Long created_at) {
        this.created_at = created_at;
    }

    public double getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
