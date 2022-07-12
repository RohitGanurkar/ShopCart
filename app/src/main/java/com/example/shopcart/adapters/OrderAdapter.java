package com.example.shopcart.adapters;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.shopcart.R;
import com.example.shopcart.activitys.OrderDetailActivity;
import com.example.shopcart.activitys.ProductDetailActivity;
import com.example.shopcart.databinding.ItemCategoriesBinding;
import com.example.shopcart.databinding.ItemProductBinding;
import com.example.shopcart.databinding.OrderLayoutBinding;
import com.example.shopcart.models.Category;
import com.example.shopcart.models.Order;

import java.util.ArrayList;
import java.util.Date;

public class OrderAdapter extends RecyclerView.Adapter<OrderAdapter.OrderViewHolder> {
    Context context;
    ArrayList<Order> orderArrayList;

    public OrderAdapter(Context context, ArrayList<Order> orderArrayList) {
        this.context = context;
        this.orderArrayList = orderArrayList;
    }

    @NonNull
    @Override
    public OrderViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new OrderAdapter.OrderViewHolder(LayoutInflater.from(context).inflate(R.layout.order_layout,parent,false));
    }

    @Override
    public void onBindViewHolder(@NonNull OrderViewHolder holder, int position) {
        Order order = orderArrayList.get(position);
        holder.binding.id.setText(order.getId()+"");
        holder.binding.code.setText(order.getCode()+"");
        holder.binding.totalFees.setText(order.getTotal_fees()+"");
        Date d = new Date(Long.parseLong(order.getCreated_at()+"")* 1000);
        holder.binding.createdAt.setText(d+"");

        holder.itemView.setOnClickListener(v -> {
            Intent intent = new Intent(context, OrderDetailActivity.class);
            intent.putExtra("order_id", order.getId()+"");
            context.startActivity(intent);
        });
    }

    @Override
    public int getItemCount() {
        return orderArrayList.size();
    }

    public class OrderViewHolder extends RecyclerView.ViewHolder{
        OrderLayoutBinding binding ;
        public OrderViewHolder(@NonNull View itemView) {
            super(itemView);
            binding = OrderLayoutBinding.bind(itemView);
        }
    }
}
