import 'package:app_ops_watcher/app_ops_type.dart';
import 'package:app_ops_watcher/app_ops_watcher_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class AppOpsWatcherPlatform extends PlatformInterface {
  AppOpsWatcherPlatform() : super(token: _token);
  static final Object _token = Object();
  static AppOpsWatcherPlatform _instance = MethodChannelAppOpsWatcher();
  static AppOpsWatcherPlatform get instance => _instance;

  static set instance(AppOpsWatcherPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int?> checkOp(AppOpsType type) {
    throw UnimplementedError('checkOp() has not been implemented.');
  }

  Future<int?> startWatching(AppOpsType type, String? myClass) {
    throw UnimplementedError('startWatching() has not been implemented.');
  }
}
