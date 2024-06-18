package com.hirameee.app_ops_watcher

import android.app.Activity
import android.app.AppOpsManager
import android.content.Context
import android.os.Build

interface AppOpsCallback {
    fun onChange()
}

class AppOpsWatcher {
    private lateinit var appOpsManager: AppOpsManager
    private var context: Context? = null
    private var activity: Activity? = null
    private lateinit var callback: AppOpsCallback

    fun init(context: Context) {
        this.context = context
        appOpsManager = context.getSystemService(Context.APP_OPS_SERVICE) as AppOpsManager
    }

    fun delete() {
        this.context = null
    }

    fun setActivity(activity: Activity?) {
        this.activity = activity
    }

    fun checkOp(ops: String): Int? {
        activity?.let {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                return appOpsManager.unsafeCheckOp(ops, android.os.Process.myUid(), it.packageName)
            } else {
                return appOpsManager.checkOp(ops, android.os.Process.myUid(), it.packageName)
            }
        }
        return null
    }

    private val opChangeListener = AppOpsManager.OnOpChangedListener { _, _ ->
        callback.onChange()
    }

    fun startWatchingMode(ops: String, callback: AppOpsCallback) {
        this.callback = callback

        activity?.let {
            appOpsManager.stopWatchingMode(opChangeListener)
            appOpsManager.startWatchingMode(ops, it.packageName, opChangeListener)
        }
    }
}