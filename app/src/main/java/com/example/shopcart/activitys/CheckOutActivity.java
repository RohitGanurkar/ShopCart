package com.example.shopcart.activitys;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.DividerItemDecoration;
import androidx.recyclerview.widget.LinearLayoutManager;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.shopcart.R;
import com.example.shopcart.adapters.CartAdapter;
import com.example.shopcart.databinding.ActivityCheckOutBinding;
import com.example.shopcart.models.Product;
import com.example.shopcart.utils.Constants;
import com.hishd.tinycart.model.Cart;
import com.hishd.tinycart.model.Item;
import com.hishd.tinycart.util.TinyCartHelper;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

public class CheckOutActivity extends AppCompatActivity {
    ActivityCheckOutBinding binding;
    ProgressDialog progressDialog;
    CartAdapter cartAdapter;
    ArrayList<Product> products;
    final int tax = 11;
    double totalPrice= 0;
    Cart cart;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityCheckOutBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        progressDialog = new ProgressDialog(this);
        progressDialog.setCancelable(false);
        progressDialog.setMessage("Processing...");


        //Using Library for cart
        products = new ArrayList<>();
        cart = TinyCartHelper.getCart();
        for (Map.Entry<Item, Integer> item : cart.getAllItemsWithQty().entrySet()){
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
            }
        });

        LinearLayoutManager layoutManager = new LinearLayoutManager(this);
        DividerItemDecoration itemDecoration = new DividerItemDecoration(this, layoutManager.getOrientation());
        binding.cartList.setLayoutManager(layoutManager);
        binding.cartList.addItemDecoration(itemDecoration);
        binding.cartList.setAdapter(cartAdapter);

        binding.subtotal.setText(String.format("PKR %.2f",cart.getTotalPrice()));

        // total price including tax
        totalPrice = (cart.getTotalPrice().doubleValue() * tax /100) + cart.getTotalPrice().doubleValue();
        binding.total.setText("PKG "+ totalPrice);

        // to Place order
        binding.checkoutBtn.setOnClickListener(v -> {
            processOrder();
        });
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    }

    // to Place order
    void processOrder(){
        progressDialog.show();
        RequestQueue queue = Volley.newRequestQueue(this);

        JSONObject productOrder = new JSONObject();
        JSONObject dataObject = new JSONObject();
        try {
            productOrder.put("address",binding.addressBox.getText().toString());
            productOrder.put("buyer",binding.nameBox.getText().toString());
            productOrder.put("comment", binding.commentBox.getText().toString());
            productOrder.put("created_at", Calendar.getInstance().getTimeInMillis());
            productOrder.put("last_update", Calendar.getInstance().getTimeInMillis());
            productOrder.put("date_ship", Calendar.getInstance().getTimeInMillis());
            productOrder.put("email", binding.emailBox.getText().toString());
            productOrder.put("phone", binding.phoneBox.getText().toString());
            productOrder.put("serial", "cab8c1a4e4421a3b");
            productOrder.put("shipping", "");
            productOrder.put("shipping_location", "");
            productOrder.put("shipping_rate", "0.0");
            productOrder.put("status", "WAITING");
            productOrder.put("tax", tax);
            productOrder.put("total_fees", totalPrice);

            JSONArray product_order_detail = new JSONArray();
            for(Map.Entry<Item, Integer> item : cart.getAllItemsWithQty().entrySet()) {
                Product product = (Product) item.getKey();
                int quantity = item.getValue();
                product.setQuantity(quantity);

                JSONObject productObj = new JSONObject();
                productObj.put("amount", quantity);
                productObj.put("price_item", product.getPrice());
                productObj.put("product_id", product.getId());
                productObj.put("product_name", product.getName());
                product_order_detail.put(productObj);
            }
            dataObject.put("product_order",productOrder);
            dataObject.put("product_order_detail",product_order_detail);


        }catch (JSONException e){
            e.printStackTrace();
        }

        // Request for process Order
        JsonObjectRequest request = new JsonObjectRequest(Request.Method.POST, Constants.POST_ORDER_URL, dataObject,
                (Response.Listener<JSONObject>) response -> {
                    try {
                        if(response.getString("status").equals("success")){
                            Toast.makeText(this, "Order Success", Toast.LENGTH_SHORT).show();
                            String orderNumber = response.getJSONObject("data").getString("code");
                            new AlertDialog.Builder(this)
                                    .setTitle("Order Successful")
                                    .setCancelable(false)
                                    .setMessage("Your order number is: " + orderNumber)
                                    .setPositiveButton("Pay Now", new DialogInterface.OnClickListener() {
                                        @Override
                                        public void onClick(DialogInterface dialogInterface, int i) {

                                        }
                                    }).show();
                            Log.d("ORDER_RES", response.toString());
                        }
                        else {
                            Toast.makeText(this, "Order Failed", Toast.LENGTH_SHORT).show();
                            new AlertDialog.Builder(this)
                                    .setTitle("Order Failed")
                                    .setCancelable(false)
                                    .setMessage("Something went wrong")
                                    .setPositiveButton("Pay Now", new DialogInterface.OnClickListener() {
                                        @Override
                                        public void onClick(DialogInterface dialogInterface, int i) {
                                        }
                                    }).show();
                            Log.d("ORDER_RES", response.toString());
                        }
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }

                }, (Response.ErrorListener) error -> {

        }) {
            // Headers for request
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                Map<String, String> headers = new HashMap<>();
                headers.put("Security","secure_code");
                return headers;
            }
        };

        queue.add(request);
    }

    @Override
    public boolean onSupportNavigateUp() {
        finish();
        return super.onSupportNavigateUp();
    }
}