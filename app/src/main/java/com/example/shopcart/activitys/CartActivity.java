package com.example.shopcart.activitys;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.DividerItemDecoration;
import androidx.recyclerview.widget.LinearLayoutManager;

import android.os.Bundle;

import com.example.shopcart.R;
import com.example.shopcart.adapters.CartAdapter;
import com.example.shopcart.databinding.ActivityCartBinding;
import com.example.shopcart.models.Product;

import java.util.ArrayList;

public class CartActivity extends AppCompatActivity {
    ActivityCartBinding binding;
    CartAdapter cartAdapter;
    ArrayList<Product> products;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityCartBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        products = new ArrayList<>();
        products.add(new Product("pro 1", "", "123", 15,55,15,1));
        products.add(new Product("pro 1", "", "123", 15,55,15,1));
        products.add(new Product("pro 1", "", "123", 15,55,15,1));

        cartAdapter = new CartAdapter(this, products);

        LinearLayoutManager layoutManager = new LinearLayoutManager(this);
        DividerItemDecoration itemDecoration = new DividerItemDecoration(this, layoutManager.getOrientation());
        binding.cartList.setLayoutManager(layoutManager);
        binding.cartList.addItemDecoration(itemDecoration);
        binding.cartList.setAdapter(cartAdapter);


        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

    }

    @Override
    public boolean onNavigateUp() {
        finish();
        return super.onNavigateUp();
    }
}