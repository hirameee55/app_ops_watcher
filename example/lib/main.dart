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
  final _watcher = AppOpsWatcher();

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
                  await _watcher.checkOp(AppOpsType.usageStats);
                  await _watcher.startWatching(AppOpsType.usageStats);
                },
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                child: const Text('systemAlertWindow'),
                onPressed: () async {
                  await _watcher.checkOp(AppOpsType.systemAlertWindow);
                  await _watcher.startWatching(AppOpsType.systemAlertWindow);
                },
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                child: const Text('pictureInPicture'),
                onPressed: () async {
                  await _watcher.checkOp(AppOpsType.pictureInPicture);
                  await _watcher.startWatching(AppOpsType.pictureInPicture);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
