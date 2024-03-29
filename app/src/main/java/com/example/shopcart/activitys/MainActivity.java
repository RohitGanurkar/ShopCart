package com.example.shopcart.activitys;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.PopupMenu;
import androidx.recyclerview.widget.GridLayoutManager;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.MenuItem;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.shopcart.R;
import com.example.shopcart.adapters.CategoryAdapter;
import com.example.shopcart.adapters.ProductAdapter;
import com.example.shopcart.databinding.ActivityMainBinding;
import com.example.shopcart.models.Category;
import com.example.shopcart.models.Product;
import com.example.shopcart.utils.Constants;
import com.google.firebase.auth.FirebaseAuth;
import com.mancj.materialsearchbar.MaterialSearchBar;
import com.razorpay.Checkout;

import org.imaginativeworld.whynotimagecarousel.model.CarouselItem;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    ProgressDialog progressDialog;
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

        progressDialog = new ProgressDialog(this);
        progressDialog.setCancelable(false);
        progressDialog.setMessage("Processing...");

        binding.searchBar.inflateMenu(R.menu.cart, R.drawable.ic_cart);
        binding.searchBar.getMenu().setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener() {
            @Override
            public boolean onMenuItemClick(MenuItem item) {
                if (item.getItemId() == R.id.cart){
                    startActivity(new Intent(MainActivity.this, CartActivity.class));
                }
                if (item.getItemId() == R.id.myOrder){
                    Toast.makeText(MainActivity.this, "Order", Toast.LENGTH_SHORT).show();
                    startActivity(new Intent(MainActivity.this, OrderActivity.class));
                }
                if (item.getItemId() == R.id.logOut){
                    Toast.makeText(MainActivity.this, "Logout", Toast.LENGTH_SHORT).show();
                    FirebaseAuth.getInstance().signOut();
                    startActivity(new Intent(MainActivity.this, LoginActivity.class));
                }
                return false;
            }
        });

        initCategory();
        initProduct();
        initSlider();

        // When Search Button was clicked
        binding.searchBar.setOnSearchActionListener(new MaterialSearchBar.OnSearchActionListener() {
            @Override
            public void onSearchStateChanged(boolean enabled) {

            }

            @Override
            public void onSearchConfirmed(CharSequence text) {
                Intent intent = new Intent(MainActivity.this, SearchActivity.class);
                intent.putExtra("query", text.toString());
                startActivity(intent);
            }

            @Override
            public void onButtonClicked(int buttonCode) {

            }
        });

    }

    private void initSlider() {
        getRecentOffers();
    }

    private void initProduct() {
        productArrayList = new ArrayList<>();
        productAdapter = new ProductAdapter(this , productArrayList);

        getRecentProducts();

        GridLayoutManager manager= new GridLayoutManager(this, 2);
        binding.productList.setLayoutManager(manager);
        binding.productList.setAdapter(productAdapter);
    }

    private void initCategory() {
        categoryArrayList = new ArrayList<>();
        categoryAdapter = new CategoryAdapter(this , categoryArrayList);

        getCategories();

        GridLayoutManager manager= new GridLayoutManager(this, 4);
        binding.categoriesList.setLayoutManager(manager);
        binding.categoriesList.setAdapter(categoryAdapter);
    }

    // get All Category from Api
    public void getCategories(){
        progressDialog.show();
        RequestQueue queue = Volley.newRequestQueue(this);

        // Making Request to get All Categories
        StringRequest request = new StringRequest(Request.Method.GET, Constants.GET_CATEGORIES_URL, response -> {
            Log.d("API_TEST", response);
            try {
                Log.d("REQUEST_STATUS", response.toString());
                JSONObject mainObject = new JSONObject(response);
                if (mainObject.getString("status").equals("success")) {
                    JSONArray categoriesArray = mainObject.getJSONArray("categories");
                    for (int i = 0; i < categoriesArray.length(); i++) {
                        JSONObject object = categoriesArray.getJSONObject(i);
                        Category category = new Category(
                                object.getString("name"),
                                Constants.CATEGORIES_IMAGE_URL + object.getString("icon"),
                                object.getString("color"),
                                object.getString("brief"),
                                object.getInt("id")
                        );
                        categoryArrayList.add(category);
                    }
                    categoryAdapter.notifyDataSetChanged();
                    progressDialog.dismiss();
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

    // get Product from Api
    public void getRecentProducts(){
        progressDialog.show();
        RequestQueue queue = Volley.newRequestQueue(this);

        // Making Request to get All Categories
        String url = Constants.GET_PRODUCTS_URL + "?count=8";
        StringRequest request = new StringRequest(Request.Method.GET, url, response -> {
            Log.d("API_TEST", response);
            try {
                Log.d("REQUEST_STATUS", response.toString());
                JSONObject mainObject = new JSONObject(response);
                if (mainObject.getString("status").equals("success")) {
                    JSONArray productsArray = mainObject.getJSONArray("products");
                    for (int i = 0; i < productsArray.length(); i++) {
                        JSONObject object = productsArray.getJSONObject(i);
                        Product product = new Product(
                                object.getString("name"),
                                Constants.PRODUCTS_IMAGE_URL + object.getString("image"),
                                object.getString("status"),
                                object.getDouble("price"),
                                object.getDouble("price_discount"),
                                object.getInt("stock"),
                                object.getInt("id")
                        );
                        productArrayList.add(product);
                    }
                    productAdapter.notifyDataSetChanged();
                    progressDialog.dismiss();
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

    // get Offers Image Sliders from Api
    public void getRecentOffers(){
        progressDialog.show();
        RequestQueue queue = Volley.newRequestQueue(this);

        // Making Request to get All Categories
        StringRequest request = new StringRequest(Request.Method.GET,Constants.GET_OFFERS_URL, response -> {
            Log.d("API_TEST", response);
            try {
                Log.d("REQUEST_Slider", response.toString());
                JSONObject mainObject = new JSONObject(response);
                if (mainObject.getString("status").equals("success")) {
                    JSONArray offerArray = mainObject.getJSONArray("news_infos");
                    for (int i = 0; i < offerArray.length(); i++) {
                        JSONObject childObj = offerArray.getJSONObject(i);
                        // Adding Data into the Slider
                        binding.carousel.addData(new CarouselItem(
                                Constants.NEWS_IMAGE_URL+childObj.getString("image"),
                                childObj.getString("title")
                        ));
                    }
                }
                else {
                    Log.i("Error_Occurred", "Error_Occurred");
                }
                progressDialog.dismiss();
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