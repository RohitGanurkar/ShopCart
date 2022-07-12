package com.example.shopcart.activitys;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;

import android.os.Bundle;
import android.util.Log;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.shopcart.R;
import com.example.shopcart.adapters.OrderAdapter;
import com.example.shopcart.adapters.OrderDetailAdapter;
import com.example.shopcart.databinding.ActivityOrderDetailBinding;
import com.example.shopcart.models.Order;
import com.example.shopcart.models.OrderDetails;
import com.example.shopcart.utils.Constants;
import com.google.firebase.auth.FirebaseAuth;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

public class OrderDetailActivity extends AppCompatActivity {
    ActivityOrderDetailBinding binding;
    ArrayList<OrderDetails> orderDetailsArrayList;
    OrderDetailAdapter orderDetailAdapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityOrderDetailBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        String order_id = getIntent().getStringExtra("order_id");
        initOrder(order_id);


        getSupportActionBar().setTitle("Orders Details");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

    }

    @Override
    public boolean onSupportNavigateUp() {
        finish();
        return super.onSupportNavigateUp();
    }

    private void initOrder(String order_id) {
        orderDetailsArrayList = new ArrayList<>();
        orderDetailAdapter = new OrderDetailAdapter(this,orderDetailsArrayList);

        getOrderDetail(order_id);

        GridLayoutManager manager= new GridLayoutManager(this, 1);
        binding.detailRv.setLayoutManager(manager);
        binding.detailRv.setAdapter(orderDetailAdapter);
    }

    private void getOrderDetail(String order_id) {
        RequestQueue queue = Volley.newRequestQueue(this);
        // Making Request to get All Categories
        StringRequest request = new StringRequest(Request.Method.GET, Constants.ORDER_DETAILS + order_id, response -> {
            Log.d("OREDERS_USER", response);
            try {
                Log.d("OREDERS_USER", response.toString());
                JSONObject mainObject = new JSONObject(response);
                if (mainObject.getString("status").equals("success")) {
                    JSONArray ordersArray  = mainObject.getJSONArray("orders");
                    for (int i = 0; i < ordersArray.length(); i++) {
                        JSONObject object = ordersArray.getJSONObject(i);
                        OrderDetails orderDetails = new OrderDetails(
                                object.getString("product_name"),
                                object.getInt("amount"),
                                object.getDouble("price_item"),
                                object.getLong("created_at")
                        );
                        orderDetailsArrayList.add(orderDetails);
                    }
                    orderDetailAdapter.notifyDataSetChanged();
                }
                else {
                    Log.i("Error_Occurred", "Error_Occurred");
                }
            }
            catch (JSONException e) {
                e.printStackTrace();
                Log.i("REQUEST_STATUS", "DATA_NOT_FOUND");
            }
        }, error -> {

        });

        queue.add(request);
    }
}