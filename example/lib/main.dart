import 'package:busy/busy.dart';
import 'package:example/busy_widget_page.dart';
import 'package:flutter/material.dart';

import 'busy_cupertino_scaffold_page.dart';
import 'busy_scaffold_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isBusy = false;

  @override
  Widget build(BuildContext context) {
    return BusyScaffold(
      isBusy: isBusy,
      scaffold: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 8),
                  FilledButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BusyScaffoldPage()),
                        );
                      },
                      child: const Text("Go to busy sfaffold")),
                  FilledButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BusyCupertinoScaffoldPage()),
                        );
                      },
                      child: const Text("Go to busy cupertino sfaffold")),
                  FilledButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BusyWidgetPage()),
                        );
                      },
                      child: const Text("Go to busy widget")),
                  ExampleStatelessWidget(
                    functionToCall: () async {
                      await Future.delayed(const Duration(seconds: 1));
                    },
                    isBusyValueChanged: (isBusyNewValue) {
                      setState(() {
                        isBusy = isBusyNewValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class ExampleStatelessWidget extends StatelessWidget {
  const ExampleStatelessWidget(
      {super.key,
      required this.functionToCall,
      required this.isBusyValueChanged});

  final Function functionToCall;
  final Function(bool) isBusyValueChanged;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () async {
        startBusyContext(
            functionToCall: functionToCall,
            isBusyValueChanged: isBusyValueChanged);
      },
      child: const Text("Load from stateless widget"),
    );
  }
}
