package com.example.demo_connect_native_app

import android.content.Intent
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    val channel = "com.example.demo_connect_native_app/openKotlin"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler { call, result ->
            if(call.method == "getMessageFromNativeCode"){
                Toast.makeText(this,call.method, Toast.LENGTH_SHORT).show()
                val intent= Intent(this, DemoActivity::class.java)
                startActivity(intent)
//                if(message.isEmpty()){
//                    result.success(message);
//                    Toast.makeText(this,"message is empty", Toast.LENGTH_SHORT).show()
//
//                }else{
//                    result.error("UNAVAILABLE", "Message from kotlin code is empty", null)
//                    Toast.makeText(this,"message is error", Toast.LENGTH_SHORT).show()
//
//                }
            } else{
                result.notImplemented()
                Toast.makeText(this,"message is notImplemented"+ call.method, Toast.LENGTH_SHORT).show()

            }
        }
    }

    private fun getMessage(): String {
        return "Message from kotlin code"
    }
}

