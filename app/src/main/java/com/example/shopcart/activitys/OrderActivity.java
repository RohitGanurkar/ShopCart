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
import com.example.shopcart.adapters.ProductAdapter;
import com.example.shopcart.databinding.ActivityOrderBinding;
import com.example.shopcart.models.Category;
import com.example.shopcart.models.Order;
import com.example.shopcart.utils.Constants;
import com.google.firebase.auth.FirebaseAuth;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

public class OrderActivity extends AppCompatActivity {
    ActivityOrderBinding binding;
    ArrayList<Order> orderArrayList;
    OrderAdapter orderAdapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityOrderBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        initOrder();
//        getOrder(FirebaseAuth.getInstance().getCurrentUser().getUid());

        getSupportActionBar().setTitle("My Orders");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    }

    private void initOrder() {
        orderArrayList = new ArrayList<>();
        orderAdapter = new OrderAdapter(this , orderArrayList);

        getOrder(FirebaseAuth.getInstance().getCurrentUser().getUid());

        GridLayoutManager manager= new GridLayoutManager(this, 1);
        binding.orderRv.setLayoutManager(manager);
        binding.orderRv.setAdapter(orderAdapter);
    }

    private void getOrder(String uid) {
        RequestQueue queue = Volley.newRequestQueue(this);
        // Making Request to get All Categories
        StringRequest request = new StringRequest(Request.Method.GET, Constants.USER_ORDERS+uid, response -> {
            Log.d("OREDERS_USER", response);
            try {
                Log.d("OREDERS_USER", response.toString());
                JSONObject mainObject = new JSONObject(response);
                if (mainObject.getString("status").equals("success")) {
                    JSONArray ordersArray  = mainObject.getJSONArray("orders");
                    for (int i = 0; i < ordersArray.length(); i++) {
                        JSONObject object = ordersArray.getJSONObject(i);
                        Order order = new Order(
                                object.getInt("id"),
                                object.getString("code"),
                                object.getDouble("total_fees"),
                                object.getLong("created_at")
                        );
                        orderArrayList.add(order);
                    }
                    orderAdapter.notifyDataSetChanged();
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


    @Override
    public boolean onSupportNavigateUp() {
        finish();
        return super.onSupportNavigateUp();
    }
}