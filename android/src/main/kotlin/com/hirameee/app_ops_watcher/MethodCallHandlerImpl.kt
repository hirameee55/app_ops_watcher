package com.hirameee.app_ops_watcher

import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

class MethodCallHandlerImpl(
    private var appOpsWatcher: AppOpsWatcher,
    private var intentSender: IntentSender
) : MethodCallHandler {
    private var channel: MethodChannel? = null

    fun startListening(messenger: BinaryMessenger) {
        channel?.let {
            stopListening()
        }
        channel = MethodChannel(messenger, "com.hirameee.plugin/app_ops_watcher")
        channel!!.setMethodCallHandler(this)
    }

    fun stopListening() {
        channel ?: return

        channel!!.setMethodCallHandler(null)
        channel = null
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "checkOp" -> {
                val type: String = call.argument("type") ?: return
                val appOpsType = AppOpsType.getItem(type) ?: return

                val state = appOpsWatcher.checkOp(appOpsType.ops)
                result.success(state)
            }

            "startWatching" -> {
                val type: String = call.argument("type") ?: return
                val myClass: String? = call.argument("myClass")
                val appOpsType = AppOpsType.getItem(type) ?: return

                intentSender.send(appOpsType.action)
                appOpsWatcher.startWatchingMode(appOpsType.ops, object : AppOpsCallback {
                    override fun onChange() {
                        intentSender.sendMyApp(myClass)

                        val state = appOpsWatcher.checkOp(appOpsType.ops)
                        result.success(state)
                    }
                })
            }

            else -> result.notImplemented()
        }
    }
}