import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'app_ops_watcher_method_channel.dart';

abstract class AppOpsWatcherPlatform extends PlatformInterface {
  /// Constructs a AppOpsWatcherPlatform.
  AppOpsWatcherPlatform() : super(token: _token);

  static final Object _token = Object();

  static AppOpsWatcherPlatform _instance = MethodChannelAppOpsWatcher();

  /// The default instance of [AppOpsWatcherPlatform] to use.
  ///
  /// Defaults to [MethodChannelAppOpsWatcher].
  static AppOpsWatcherPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AppOpsWatcherPlatform] when
  /// they register themselves.
  static set instance(AppOpsWatcherPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
