import 'package:busy/src/base_busy_stateless_widget.dart';
import 'package:flutter/material.dart';

class BusyScaffold extends BaseBusyStatelessWidget {
  const BusyScaffold({super.key, required isBusy, required this.scaffold})
      : super(isBusy: isBusy, child: scaffold);

  final Scaffold scaffold;

  @override
  Widget build(BuildContext context) {
    var appBarSize = scaffold.appBar?.preferredSize ?? const Size(0, 0);

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
                        child: Column(
                          children: [
                            SizedBox(height: appBarSize.height),
                            const LinearProgressIndicator(),
                          ],
                        )))
              ],
            )));
  }
}
