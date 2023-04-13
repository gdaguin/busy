import 'package:busy/busy.dart';
import 'package:flutter/material.dart';

class BusyScaffoldPage extends StatefulWidget {
  const BusyScaffoldPage({super.key});

  @override
  State<BusyScaffoldPage> createState() => _BusyScaffoldPageState();
}

class _BusyScaffoldPageState extends State<BusyScaffoldPage> {
  @override
  Widget build(BuildContext context) {
    return BusyScaffold(
        isBusy: isBusy,
        scaffold: Scaffold(
            appBar: AppBar(
              title: const Text("Busy scaffold"),
            ),
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 8),
                    FilledButton(
                        onPressed: () {
                          startBusyContext(() async {
                            await Future.delayed(const Duration(seconds: 2));
                          });
                        },
                        child: Text("Start async method")),
                  ],
                ),
              ),
            )));
  }
}
