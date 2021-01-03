package com.example.Mrbn;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends Activity {

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    // Button myButton = (Button) findViewById(R.id.my_button);
    setContentView(R.layout.activity_main);
  }

  /** Called when the user touches the button */
  public void sendMessage(View v) {
    TextView mTextView = (TextView) findViewById(R.id.button);
    mTextView.setText("Welcome to Dynamic TextView");
    // Do something in response to button click
  }
}
