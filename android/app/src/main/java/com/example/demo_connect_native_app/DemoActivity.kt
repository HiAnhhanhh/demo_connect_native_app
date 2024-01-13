package com.example.demo_connect_native_app
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragment
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class DemoActivity : AppCompatActivity() {

    private val CHANNEL = "your_channel_name"


    override fun onCreate(savedInstanceState: Bundle?) {

        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_demo)

        val  button = findViewById<Button>(R.id.click_btn)

        button.setOnClickListener {
            val flutterEngine = FlutterEngine(this)
            flutterEngine.navigationChannel.setInitialRoute("/MyHomeView")
            GeneratedPluginRegistrant.registerWith(flutterEngine)
            startActivity(
                FlutterActivity.createDefaultIntent(this)
                    .putExtra("route", "/MyHomeView")
            )
            finish()
        }

    }
}