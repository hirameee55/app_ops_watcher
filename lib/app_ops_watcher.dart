import 'package:app_ops_watcher/app_ops_type.dart';
import 'package:app_ops_watcher/app_ops_watcher_platform_interface.dart';

class AppOpsWatcher {
  Future<int?> checkOp(AppOpsType type) {
    return AppOpsWatcherPlatform.instance.checkOp(type);
  }

  Future<int?> startWatching(AppOpsType type, {String? myClass}) {
    return AppOpsWatcherPlatform.instance.startWatching(type, myClass);
  }
}
