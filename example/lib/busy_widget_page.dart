import 'package:busy/export.dart';
import 'package:flutter/material.dart';

class BusyWidgetPage extends StatefulWidget {
  const BusyWidgetPage({super.key});

  @override
  State<BusyWidgetPage> createState() => _BusyWidgetPageState();
}

class _BusyWidgetPageState extends State<BusyWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Busy widget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            BusyWidget(
                isBusy: isBusy,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.33,
                  child: Container(
                      color: Colors.blue,
                      child: const Center(child: Text("Busy widget"))),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.33,
              child: Container(
                  color: Colors.red,
                  child: const Center(child: Text("Non busy widget"))),
            ),
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
    );
  }
}
