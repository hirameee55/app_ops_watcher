package com.hirameee.app_ops_watcher

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

class AppOpsWatcherPlugin : FlutterPlugin, ActivityAware {

    companion object{
        const val TAG = "AppOpsWatcher"
    }

    private var methodCallHandler: MethodCallHandlerImpl
    private var appOpsWatcher: AppOpsWatcher = AppOpsWatcher()
    private var intentSender: IntentSender = IntentSender()

    init {
        methodCallHandler = MethodCallHandlerImpl(appOpsWatcher, intentSender)
    }

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        appOpsWatcher.init(flutterPluginBinding.applicationContext)
        methodCallHandler.startListening(flutterPluginBinding.binaryMessenger)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        appOpsWatcher.delete()
        methodCallHandler.stopListening()
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        appOpsWatcher.setActivity(binding.activity)
        intentSender.setActivity(binding.activity)
    }

    override fun onDetachedFromActivity() {
        appOpsWatcher.setActivity(null)
        intentSender.setActivity(null)
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }
}