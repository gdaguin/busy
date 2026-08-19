import 'package:busy/src/base_busy_stateless_widget.dart';
import 'package:material_ui/material_ui.dart';

class BusyScaffold extends BaseBusyStatelessWidget {
  const BusyScaffold({super.key, required super.isBusy, required this.scaffold, super.progress})
      : super(child: scaffold);

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
                            LinearProgressIndicator(value: progress),
                          ],
                        )))
              ],
            )));
  }
}
