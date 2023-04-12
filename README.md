# busy

A flutter package that focuses on the busy state.

## Getting Started

![Screenshot](https://raw.githubusercontent.com/gdaguin/busy/main/doc/images/busy.gif)

## Features
* Adds an isBusy attribute to a State object.
* Adds a startBusyContext method that automatically manages the state of the isBusy property.
* BusyScaffold : scaffold with auto managed busy state
* BusyCupertinoScaffold : cupertino scaffold with auto managed busy state
* BusyWidget : widget with auto managed busy state

## Usage

### BusyScaffold
Use this widget in your material application.

![Screenshot](https://raw.githubusercontent.com/gdaguin/busy/main/doc/images/busy.gif)

```
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
```

### BusyCupertinoScaffold

Use this widget in your iOS application.

![Screenshot](https://raw.githubusercontent.com/gdaguin/busy/main/doc/images/busy-cupertino.gif)

```
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
```

### BusyWidget

![Screenshot](https://raw.githubusercontent.com/gdaguin/busy/main/doc/images/busy-widget.gif)

```
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
```