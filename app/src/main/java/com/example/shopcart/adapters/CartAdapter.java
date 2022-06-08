package com.example.shopcart.adapters;

import android.app.AlertDialog;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.example.shopcart.R;
import com.example.shopcart.databinding.ItemCartBinding;
import com.example.shopcart.databinding.QuantityDialogBinding;
import com.example.shopcart.models.Product;

import java.util.ArrayList;

public class CartAdapter extends RecyclerView.Adapter<CartAdapter.CartViewHolder>{
    Context context;
    ArrayList<Product> products;

    public CartAdapter(Context context, ArrayList<Product> products) {
        this.context = context;
        this.products = products;
    }

    @NonNull
    @Override
    public CartViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new CartViewHolder(LayoutInflater.from(context).inflate(R.layout.item_cart,parent,false));
    }

    @Override
    public void onBindViewHolder(@NonNull CartViewHolder holder, int position) {
        Product product = products.get(position);
        Glide.with(context)
                .load(product.getImage())
                .into(holder.binding.image);
        holder.binding.name.setText(product.getName());
        holder.binding.price.setText("PKG " + product.getPrice());

        holder.itemView.setOnClickListener(v -> {
            QuantityDialogBinding quantityDialogBinding = QuantityDialogBinding.inflate(LayoutInflater.from(context));
            AlertDialog dialog = new AlertDialog.Builder(context)
                    .setView(quantityDialogBinding.getRoot())
                    .create();
            dialog.getWindow().setBackgroundDrawable(new ColorDrawable(android.R.color.transparent));
            quantityDialogBinding.productName.setText(product.getName());
            quantityDialogBinding.productStock.setText("Stock: " + product.getStock());
            quantityDialogBinding.plusBtn.setOnClickListener(v1 -> {

            });
            quantityDialogBinding.minusBtn.setOnClickListener(v2 -> {

            });
            quantityDialogBinding.saveBtn.setOnClickListener(v3 -> {

            });
            dialog.show();
        });
    }

    @Override
    public int getItemCount() {
        return products.size();
    }

    public class CartViewHolder extends RecyclerView.ViewHolder{
        ItemCartBinding binding;
        public CartViewHolder(@NonNull View itemView) {
            super(itemView);
            binding = ItemCartBinding.bind(itemView);
        }
    }
}
