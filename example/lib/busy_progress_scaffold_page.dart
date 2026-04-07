import 'dart:async';
import 'package:busy/busy.dart';
import 'package:flutter/material.dart';

class BusyProgressScaffoldPage extends StatefulWidget {
  final bool withTimeout;

  const BusyProgressScaffoldPage({super.key, this.withTimeout = false});

  @override
  State<BusyProgressScaffoldPage> createState() =>
      _BusyProgressScaffoldPageState();
}

class _BusyProgressScaffoldPageState extends State<BusyProgressScaffoldPage> {
  double progress = 0.0;
  bool isBusy = false;
  Timer? _timer;

  void startProgress() {
    setState(() {
      isBusy = true;
      progress = 0.0;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        progress += 0.1;
        if (progress >= 1.0) {
          progress = 0.0;
          isBusy = false;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BusyScaffold(
      isBusy: isBusy,
      progress: progress,
      scaffold: Scaffold(
        appBar: AppBar(title: const Text("Busy scaffold")),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: startProgress,
                  child: const Text("Start Progress"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}