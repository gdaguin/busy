import 'package:busy/busy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BusyCupertinoScaffoldPage extends StatefulWidget {
  const BusyCupertinoScaffoldPage({super.key});

  @override
  State<BusyCupertinoScaffoldPage> createState() => _BusyCupertinoScaffoldPageState();
}

class _BusyCupertinoScaffoldPageState extends State<BusyCupertinoScaffoldPage> {
  @override
  Widget build(BuildContext context) {
    return BusyCupertinoScaffold(
        isBusy: isBusy,
        scaffold: CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Text("Busy cupertino scaffold"),
            ),
            child: SafeArea(
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
                        child: const Text("Start async method")),
                  ],
                ),
              ),
            )));
  }
}
