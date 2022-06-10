package com.example.shopcart.activitys;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

import com.example.shopcart.R;
import com.example.shopcart.databinding.ActivityPaymentBinding;
import com.example.shopcart.utils.Constants;

public class PaymentActivity extends AppCompatActivity {
    ActivityPaymentBinding binding;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityPaymentBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        String orderCode = getIntent().getStringExtra("orderCode");

        binding.webview.setMixedContentAllowed(true);
        binding.webview.loadUrl(Constants.PAYMENT_URL);

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    }

    @Override
    public boolean onSupportNavigateUp() {
        finish();
        return super.onSupportNavigateUp();
    }
}