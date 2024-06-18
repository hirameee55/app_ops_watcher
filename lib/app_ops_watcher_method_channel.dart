import 'package:app_ops_watcher/app_ops_type.dart';
import 'package:app_ops_watcher/app_ops_watcher_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class MethodChannelAppOpsWatcher extends AppOpsWatcherPlatform {
  @visibleForTesting
  final methodChannel =
      const MethodChannel('com.hirameee.plugin/app_ops_watcher');

  @override
  Future<int?> checkOp(AppOpsType type) async {
    final state = await methodChannel.invokeMethod<int>('checkOp', {
      'type': type.name,
    });
    return state;
  }

  @override
  Future<int?> startWatching(AppOpsType type, String? myClass) async {
    final state = await methodChannel.invokeMethod<int>('startWatching', {
      'type': type.name,
      'myClass': myClass,
    });
    return state;
  }
}
