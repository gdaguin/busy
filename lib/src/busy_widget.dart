import 'package:busy/src/base_busy_stateless_widget.dart';
import 'package:material_ui/material_ui.dart';

class BusyWidget extends BaseBusyStatelessWidget {
  const BusyWidget({super.key, required super.isBusy, required super.child, super.progress});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: canPop(isBusy),
        child: IgnorePointer(
            ignoring: isBusy, // all taps will have no effects
            child: Stack(
              children: [
                child,
                if (isBusy)
                  Positioned.fill(
                    child: getBusyContainer(context),
                  ),
                if (isBusy) getBusyContainer(context),
                Positioned.fill(
                  child: Align(
                      alignment: Alignment.center,
                      child: Visibility(
                          visible: isBusy,
                          child: CircularProgressIndicator(value: progress))),
                ),
              ],
            )));
  }
}
