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
    ),
    PICTURE_IN_PICTURE_SETTINGS(
        "pictureInPicture",
        AppOpsManager.OPSTR_PICTURE_IN_PICTURE,
        "android.settings.PICTURE_IN_PICTURE_SETTINGS",
    ),
    WRITE_SETTINGS(
        "writeSettings",
        AppOpsManager.OPSTR_WRITE_SETTINGS,
        Settings.ACTION_MANAGE_WRITE_SETTINGS,
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
