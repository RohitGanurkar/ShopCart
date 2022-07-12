package com.example.shopcart.activitys;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;
import com.example.shopcart.R;
import com.example.shopcart.databinding.ActivitySignupBinding;
import com.example.shopcart.utils.Constants;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Objects;

public class SignupActivity extends AppCompatActivity {
    ActivitySignupBinding binding;
    FirebaseAuth firebaseAuth;
//    FirebaseDatabase database;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivitySignupBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        firebaseAuth = FirebaseAuth.getInstance();
//        database = FirebaseDatabase.getInstance();

        // when SignUp button was clicked
        binding.signup.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final String name = Objects.requireNonNull(binding.nameText.getText()).toString();
                final String mobile = Objects.requireNonNull(binding.mobileNumber.getText()).toString();
                final String email = Objects.requireNonNull(binding.emailText.getText()).toString();
                final String password = Objects.requireNonNull(binding.passwordText.getText()).toString();

                if (email.length() > 0 || password.length() > 0){
                    // for Create User in Firebase
                    firebaseAuth.createUserWithEmailAndPassword(email, password)
                            .addOnCompleteListener(new OnCompleteListener<AuthResult>() {
                                @Override
                                public void onComplete(@NonNull Task<AuthResult> task) {
                                    if (task.isSuccessful()) {
                                        addUser(name,mobile, email);
                                    } else {
                                        Toast.makeText(SignupActivity.this, "Some Error Occurred", Toast.LENGTH_SHORT).show();
                                    }
                                }
                            });
                }
                else {
                    Toast.makeText(SignupActivity.this, "Please fill all the Details", Toast.LENGTH_SHORT).show();
                }
            }
        });

        // for goto LogIn Page
        binding.gotoLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(SignupActivity.this, LoginActivity.class);
                startActivity(intent);
            }
        });
    }

    private void addUser(String name, String mobile , String email) {
        RequestQueue queue = Volley.newRequestQueue(this);
        JSONObject user = new JSONObject();
        try {
            user.put("user_id", FirebaseAuth.getInstance().getCurrentUser().getUid());
            user.put("name", name);
            user.put("mobile",mobile);
            user.put("email",email);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        JsonObjectRequest request = new JsonObjectRequest(Request.Method.POST, Constants.ADD_USER, user, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                try {
                    if(response.getString("status").equals("success")){
                        Toast.makeText(SignupActivity.this, "Successfully Signin", Toast.LENGTH_SHORT).show();
                        Intent intent = new Intent(SignupActivity.this, MainActivity.class);
                        startActivity(intent);
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        });
        queue.add(request);
    }
}