import 'package:busy/busy.dart';
import 'package:flutter/material.dart';

class BusyScaffoldPage extends StatefulWidget {
  final bool withTimeout;

  const BusyScaffoldPage({super.key, this.withTimeout = false});

  @override
  State<BusyScaffoldPage> createState() => _BusyScaffoldPageState();
}

class _BusyScaffoldPageState extends State<BusyScaffoldPage> {
  @override
  Widget build(BuildContext context) {
    return BusyScaffold(
      isBusy: isBusy,
      scaffold: Scaffold(
        appBar: AppBar(title: const Text("Busy scaffold")),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 8),
                FilledButton(
                  onPressed: () {
                    startBusyContext(
                      () async {
                        await Future.delayed(Duration(seconds: 5));
                      },
                      timeout:
                          widget.withTimeout
                              ? TimeoutConfig(
                                Duration(seconds: 3),
                                onTimeout: () {
                                  final snackBar = SnackBar(
                                    content: Text("Timeout"),
                                  );
                                  ScaffoldMessenger.of(
                                    context,
                                  ).showSnackBar(snackBar);
                                },
                              )
                              : null,
                    );
                  },
                  child: const Text("Start async method"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
