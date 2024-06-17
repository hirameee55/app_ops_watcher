import 'package:flutter_test/flutter_test.dart';
import 'package:app_ops_watcher/app_ops_watcher.dart';
import 'package:app_ops_watcher/app_ops_watcher_platform_interface.dart';
import 'package:app_ops_watcher/app_ops_watcher_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAppOpsWatcherPlatform
    with MockPlatformInterfaceMixin
    implements AppOpsWatcherPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AppOpsWatcherPlatform initialPlatform = AppOpsWatcherPlatform.instance;

  test('$MethodChannelAppOpsWatcher is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAppOpsWatcher>());
  });

  test('getPlatformVersion', () async {
    AppOpsWatcher appOpsWatcherPlugin = AppOpsWatcher();
    MockAppOpsWatcherPlatform fakePlatform = MockAppOpsWatcherPlatform();
    AppOpsWatcherPlatform.instance = fakePlatform;

    expect(await appOpsWatcherPlugin.getPlatformVersion(), '42');
  });
}
