package com.example.shopcart.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.shopcart.R;
import com.example.shopcart.databinding.OrderDetailLayoutBinding;
import com.example.shopcart.databinding.OrderLayoutBinding;
import com.example.shopcart.models.Order;
import com.example.shopcart.models.OrderDetails;

import java.util.ArrayList;
import java.util.Date;

public class OrderDetailAdapter extends RecyclerView.Adapter<OrderDetailAdapter.OrderDetailsViewHolder> {

    Context context;
    ArrayList<OrderDetails> orderDetailsList;

    public OrderDetailAdapter(Context context, ArrayList<OrderDetails> orderDetails) {
        this.context = context;
        this.orderDetailsList = orderDetails;
    }

    @NonNull
    @Override
    public OrderDetailsViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new OrderDetailAdapter.OrderDetailsViewHolder(LayoutInflater.from(context).inflate(R.layout.order_detail_layout,parent,false));
    }

    @Override
    public void onBindViewHolder(@NonNull OrderDetailsViewHolder holder, int position) {
        OrderDetails order = orderDetailsList.get(position);
        holder.binding.proName.setText(order.getProductName()+"");
        holder.binding.amount.setText(order.getAmount()+"");
        holder.binding.pri.setText(order.getPrice()+"");
        Date d = new Date(Long.parseLong(order.getCreated_at()+"")* 1000);
        holder.binding.create.setText(d+"");

    }

    @Override
    public int getItemCount() {
        return orderDetailsList.size();
    }

    public class OrderDetailsViewHolder extends RecyclerView.ViewHolder{
        OrderDetailLayoutBinding binding ;
        public OrderDetailsViewHolder(@NonNull View itemView) {
            super(itemView);
            binding = OrderDetailLayoutBinding.bind(itemView);
        }
    }
}
