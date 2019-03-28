package com.example.jedi;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    // 设置状态栏颜色透明（API>21才有效）。
    getWindow().setStatusBarColor(0);
    GeneratedPluginRegistrant.registerWith(this);
  }
}
