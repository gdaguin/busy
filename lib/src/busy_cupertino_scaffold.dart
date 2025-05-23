import 'package:flutter/cupertino.dart';

import 'base_busy_stateless_widget.dart';

class BusyCupertinoScaffold extends BaseBusyStatelessWidget {
  const BusyCupertinoScaffold(
      {super.key, required isBusy, required this.scaffold})
      : super(isBusy: isBusy, child: scaffold);

  final CupertinoPageScaffold scaffold;

  @override
  Widget build(BuildContext context) {
    var appBarSize = scaffold.navigationBar?.preferredSize ?? const Size(0, 0);

    return PopScope(
        canPop: canPop(isBusy),
        child: IgnorePointer(
            ignoring: isBusy,
            child: Stack(
              children: [
                scaffold,
                if (isBusy) getBusyContainer(context),
                SafeArea(
                    child: Visibility(
                        visible: isBusy,
                        child: Stack(
                          children: [
                            SizedBox(height: appBarSize.height),
                            const Center(child: CupertinoActivityIndicator())
                          ],
                        )))
              ],
            )));
  }
}
