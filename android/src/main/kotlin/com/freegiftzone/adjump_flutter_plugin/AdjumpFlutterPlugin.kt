package com.freegiftzone.adjump_flutter_plugin

import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.leadmint.adjump.offerwall.AdJump
/**
 * Plugin implementation that bridges Dart ↔️ native AdJump SDK via MethodChannel.
 */
class AdjumpFlutterPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
  private lateinit var channel: MethodChannel
  private lateinit var context: Context
  private var adjump: AdJump? = null

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    context = binding.applicationContext
    channel = MethodChannel(binding.binaryMessenger, "adjump_flutter_plugin")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
      "initialize" -> {
        val accountId = call.argument<String>("accountId")
        val appId     = call.argument<String>("appId")
        val userId    = call.argument<String>("userId")
        if (accountId.isNullOrEmpty() || appId.isNullOrEmpty() || userId.isNullOrEmpty()) {
          result.error("INVALID_ARGS", "accountId, appId, and userId are required", null)
          return
        }
        adjump = AdJump(context, accountId, appId, userId)
        adjump!!.initialize(context)
        result.success(null)
      }
      "launchOfferWall" -> {
        if (adjump == null) {
          result.error("NOT_INITIALIZED", "Call initialize() before launchOfferWall()", null)
          return
        }
        adjump!!.launchOfferWall()
        result.success(null)
      }
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
