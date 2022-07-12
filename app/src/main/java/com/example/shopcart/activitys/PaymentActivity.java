package com.example.shopcart.activitys;

import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.shopcart.R;
import com.example.shopcart.databinding.ActivityPaymentBinding;
import com.example.shopcart.utils.Constants;
import com.razorpay.Checkout;
import com.razorpay.PaymentResultListener;

import org.json.JSONException;
import org.json.JSONObject;

public class PaymentActivity extends AppCompatActivity implements PaymentResultListener {
    ActivityPaymentBinding binding;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityPaymentBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        Checkout.preload(getApplicationContext());

        String orderCode = getIntent().getStringExtra("orderCode");
        getPayDetails(orderCode);

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    }

    @Override
    public boolean onSupportNavigateUp() {
        finish();
        return super.onSupportNavigateUp();
    }

    @Override
    public void onPaymentSuccess(String s) {
        Toast.makeText(this, "Payment_Successfully_Done", Toast.LENGTH_SHORT).show();
        startActivity(new Intent(this, MainActivity.class));
    }

    @Override
    public void onPaymentError(int i, String s) {

        Toast.makeText(this, "Payment_Failed", Toast.LENGTH_SHORT).show();
        startActivity(new Intent(this, MainActivity.class));
    }

    public void getPayDetails(String orderCode){
        RequestQueue queue = Volley.newRequestQueue(this);

        StringRequest request = new StringRequest(Request.Method.GET, Constants.PAYMENT_URL+orderCode, response -> {
            try {
                Log.d("PAY_DETAILS_STATUS", response.toString());
                JSONObject mainObject = new JSONObject(response);
                if (mainObject.getString("status").equals("success")) {
                    JSONObject payObj = mainObject.getJSONObject("payDetails");
                    Checkout checkout = new Checkout();

                    checkout.setKeyID("rzp_test_qQqAY49tHszEqw");

                    checkout.setImage(0);

                    JSONObject object = new JSONObject();
                    try {
                        object.put("name", payObj.getString("buyer"));
                        object.put("description", "it is RazorPay");
                        object.put("currency", "INR");
                        object.put("amount", payObj.getString("total_fees")+"");
                        JSONObject prefill = new JSONObject();
                        prefill.put("email", "rrrrr@gmil.com");
                        object.put("prefill", prefill);

                        checkout.open(PaymentActivity.this, object);
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
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