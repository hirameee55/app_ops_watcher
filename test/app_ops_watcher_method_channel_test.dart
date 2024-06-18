import 'package:app_ops_watcher/app_ops_type.dart';
import 'package:app_ops_watcher/app_ops_watcher_method_channel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  MethodChannelAppOpsWatcher platform = MethodChannelAppOpsWatcher();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      platform.methodChannel,
      (methodCall) async {
        switch (methodCall.method) {
          case 'checkOp':
            return 0;

          case 'startWatching':
            return 1;
        }

        return null;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(platform.methodChannel, null);
  });

  test('checkOp', () async {
    expect(await platform.checkOp(AppOpsType.systemAlertWindow), 0);
  });

  test('startWatching', () async {
    expect(await platform.startWatching(AppOpsType.systemAlertWindow, null), 1);
  });
}
