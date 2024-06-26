package com.hirameee.app_ops_watcher

import android.app.Activity
import android.content.ActivityNotFoundException
import android.content.Intent
import android.net.Uri
import android.util.Log

class IntentSender {
    private var activity: Activity? = null

    fun setActivity(activity: Activity?) {
        this.activity = activity
    }

    fun sendMyApp(myClass: String?) {
        try {
            activity?.let {
                val intent = Intent(Intent.ACTION_MAIN)
                intent.setPackage(it.packageName)
                intent.setClassName(
                    it.packageName,
                    it.packageName + "." + (myClass ?: "MainActivity")
                )
                intent.flags = Intent.FLAG_ACTIVITY_CLEAR_TOP
                it.startActivity(intent)
            }
        } catch (e: ActivityNotFoundException) {
            Log.w(AppOpsWatcherPlugin.TAG, e)
        }
    }

    fun send(action: String) {
        try {
            activity?.let {
                val intent = Intent(action)
                intent.data = Uri.fromParts("package", it.packageName, null)
                intent.flags = Intent.FLAG_ACTIVITY_CLEAR_TOP
                it.startActivity(intent)
            }
        } catch (e: ActivityNotFoundException) {
            Log.w(AppOpsWatcherPlugin.TAG, e)
        }
    }
}