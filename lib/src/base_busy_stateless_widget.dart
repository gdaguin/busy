import 'package:flutter/material.dart';

abstract class BaseBusyStatelessWidget extends StatelessWidget {
  const BaseBusyStatelessWidget({super.key, required this.isBusy, required this.child});

  final bool isBusy;
  final Widget child;

  // Manage whether or not the page can be popped
  // (with app bar back button pressed or virtual back button pressed)
  WillPopCallback? onWillPop(bool isBusy) {
    if (isBusy == false) {
      return null;
    }
    return () async => isBusy == false;
  }

  Widget getBusyContainer(BuildContext context) {
    return Container(color: Theme.of(context).colorScheme.surface.withOpacity(0.5));
  }
}
