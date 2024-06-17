
import 'app_ops_watcher_platform_interface.dart';

class AppOpsWatcher {
  Future<String?> getPlatformVersion() {
    return AppOpsWatcherPlatform.instance.getPlatformVersion();
  }
}
