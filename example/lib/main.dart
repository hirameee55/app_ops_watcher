import 'package:app_ops_watcher/app_ops_type.dart';
import 'package:flutter/material.dart';
import 'package:app_ops_watcher/app_ops_watcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appOpsManagerPlugin = AppOpsWatcher();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AppOpsManager'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              OutlinedButton(
                child: const Text('usageStats'),
                onPressed: () async {
                  // final a =
                  //     await _appOpsManagerPlugin.checkOp(AppOpsType.usageStats);
                  // print('checkOp $a');

                  final b = await _appOpsManagerPlugin
                      .startWatching(AppOpsType.usageStats);
                  print('startWatching $b');
                },
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                child: const Text('systemAlertWindow'),
                onPressed: () async {
                  // final a = await _appOpsManagerPlugin
                  //     .checkOp(AppOpsType.systemAlertWindow);
                  // print('checkOp $a');

                  final b = await _appOpsManagerPlugin
                      .startWatching(AppOpsType.systemAlertWindow);
                  print('startWatching $b');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
