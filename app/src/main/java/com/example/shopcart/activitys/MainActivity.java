package com.example.shopcart.activitys;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;

import android.os.Bundle;

import com.example.shopcart.adapters.CategoryAdapter;
import com.example.shopcart.adapters.ProductAdapter;
import com.example.shopcart.databinding.ActivityMainBinding;
import com.example.shopcart.models.Category;
import com.example.shopcart.models.Product;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    ActivityMainBinding binding;
    CategoryAdapter categoryAdapter;
    ProductAdapter productAdapter;
    ArrayList<Category> categoryArrayList;
    ArrayList<Product> productArrayList;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        initCategory();
        initProduct();

    }

    private void initProduct() {
        productArrayList = new ArrayList<>();
        String link = "https://img.freepik.com/free-photo/cool-geometric-triangular-figure-neon-laser-light-great-backgrounds-wallpapers_181624-9331.jpg?w=2000" ;

        productArrayList.add(new Product("mobile", link, "xxx", 12, 10, 2, 3));
        productArrayList.add(new Product("lappy", link, "xxx", 12, 10, 2, 3));
        productArrayList.add(new Product("pc", link, "xxx", 12, 10, 2, 3));
        productArrayList.add(new Product("mac", link, "xxx", 12, 10, 2, 3));

        productAdapter = new ProductAdapter(this , productArrayList);
        GridLayoutManager manager= new GridLayoutManager(this, 2);
        binding.productList.setLayoutManager(manager);
        binding.productList.setAdapter(productAdapter);
    }

    private void initCategory() {
        categoryArrayList = new ArrayList<>();
        String link = "https://img.freepik.com/free-photo/cool-geometric-triangular-figure-neon-laser-light-great-backgrounds-wallpapers_181624-9331.jpg?w=2000" ;
        categoryArrayList.add(new Category("sport", link,"#FF018786", "yse we are", 1));
        categoryArrayList.add(new Category("maru", link,"#FF018786", "yse we are", 1));
        categoryArrayList.add(new Category("sport", link,"#FF018786", "yse we are", 1));
        categoryArrayList.add(new Category("sport", link,"#FF018786", "yse we are", 1));
        categoryArrayList.add(new Category("sport", link,"#FF018786", "yse we are", 1));

        categoryAdapter = new CategoryAdapter(this , categoryArrayList);
        GridLayoutManager manager= new GridLayoutManager(this, 4);
        binding.categoriesList.setLayoutManager(manager);
        binding.categoriesList.setAdapter(categoryAdapter);
    }
}