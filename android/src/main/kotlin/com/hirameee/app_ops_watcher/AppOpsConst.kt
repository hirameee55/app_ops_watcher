package com.hirameee.app_ops_watcher

import android.app.AppOpsManager
import android.provider.Settings

enum class AppOpsType(val typeName: String, val ops: String, val action: String) {
    USAGE_STATS(
        "usageStats",
        AppOpsManager.OPSTR_GET_USAGE_STATS,
        Settings.ACTION_USAGE_ACCESS_SETTINGS
    ),
    SYSTEM_ALERT_WINDOW(
        "systemAlertWindow",
        AppOpsManager.OPSTR_SYSTEM_ALERT_WINDOW,
        Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
    );

    companion object {
        fun getItem(name: String): AppOpsType? {
            for (item in enumValues<AppOpsType>()) {
                if (item.typeName == name) {
                    return item
                }
            }
            return null
        }
    }
}
