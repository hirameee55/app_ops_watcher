import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'app_ops_watcher_platform_interface.dart';

/// An implementation of [AppOpsWatcherPlatform] that uses method channels.
class MethodChannelAppOpsWatcher extends AppOpsWatcherPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('app_ops_watcher');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
