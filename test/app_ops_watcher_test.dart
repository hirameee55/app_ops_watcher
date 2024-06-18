import 'package:app_ops_watcher/app_ops_type.dart';
import 'package:app_ops_watcher/app_ops_watcher.dart';
import 'package:app_ops_watcher/app_ops_watcher_method_channel.dart';
import 'package:app_ops_watcher/app_ops_watcher_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAppOpsManagerPlatform
    with MockPlatformInterfaceMixin
    implements AppOpsWatcherPlatform {
  @override
  Future<int?> checkOp(AppOpsType type) async => 1;

  @override
  Future<int?> startWatching(AppOpsType type, String? myClass) async => 0;
}

void main() {
  final AppOpsWatcherPlatform initialPlatform = AppOpsWatcherPlatform.instance;

  test('$MethodChannelAppOpsWatcher is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAppOpsWatcher>());
  });

  test('checkOp', () async {
    AppOpsWatcher appOpsManagerPlugin = AppOpsWatcher();
    MockAppOpsManagerPlatform fakePlatform = MockAppOpsManagerPlatform();
    AppOpsWatcherPlatform.instance = fakePlatform;

    expect(await appOpsManagerPlugin.checkOp(AppOpsType.usageStats), 1);
  });

  test('startWatching', () async {
    AppOpsWatcher appOpsManagerPlugin = AppOpsWatcher();
    MockAppOpsManagerPlatform fakePlatform = MockAppOpsManagerPlatform();
    AppOpsWatcherPlatform.instance = fakePlatform;

    expect(await appOpsManagerPlugin.startWatching(AppOpsType.usageStats), 0);
  });
}
