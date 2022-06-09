package com.example.shopcart.activitys;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.DividerItemDecoration;
import androidx.recyclerview.widget.LinearLayoutManager;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import com.example.shopcart.R;
import com.example.shopcart.adapters.CartAdapter;
import com.example.shopcart.databinding.ActivityCartBinding;
import com.example.shopcart.models.Product;
import com.hishd.tinycart.model.Cart;
import com.hishd.tinycart.model.Item;
import com.hishd.tinycart.util.TinyCartHelper;

import java.util.ArrayList;
import java.util.Map;

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

        //Using Library for cart
        Cart cart = TinyCartHelper.getCart();
        for (Map.Entry<Item , Integer> item : cart.getAllItemsWithQty().entrySet()){
            Product product = (Product) item.getKey();
            int quantity = item.getValue();
            product.setQuantity(quantity);
            products.add(product);
        }

        // Adapter for Cart RV
        cartAdapter = new CartAdapter(this, products, new CartAdapter.CartListener() {
            @Override
            public void onQuantityChanged() {
                binding.subtotal.setText(String.format("PKR %.2f",cart.getTotalPrice()));
//                getAllPrice();
            }
        });

        LinearLayoutManager layoutManager = new LinearLayoutManager(this);
        DividerItemDecoration itemDecoration = new DividerItemDecoration(this, layoutManager.getOrientation());
        binding.cartList.setLayoutManager(layoutManager);
        binding.cartList.addItemDecoration(itemDecoration);
        binding.cartList.setAdapter(cartAdapter);

        binding.subtotal.setText(String.format("PKR %.2f",cart.getTotalPrice()));

        // when continueBtn was clicked
        binding.continueBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(CartActivity.this, CheckOutActivity.class));
            }
        });

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

    }
// get all price without using library's method
//    private void getAllPrice() {
//        double price = 0;
//        for (Product p:
//             products) {
//            price = price + (p.getPrice() * p.getQuantity());
//        }
//        Toast.makeText(this, price+"", Toast.LENGTH_SHORT).show();
//        Log.d("Total_Price", price+"");
//    }

    @Override
    public boolean onSupportNavigateUp() {
        finish();
        return super.onSupportNavigateUp();
    }

}