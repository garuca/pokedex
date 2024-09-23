package com.example.pokedex
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.pokedex/methods"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getNativeMessage") {
                val message = getNativeMessage()
                result.success(message)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getNativeMessage(): String {
        return "Mensagem vinda do código nativo Android!"
    }
}