import 'package:flutter/material.dart';

abstract class BaseBusyStatelessWidget extends StatelessWidget {
  const BaseBusyStatelessWidget(
      {super.key, required this.isBusy, required this.child});

  final bool isBusy;
  final Widget child;

  // Manage whether or not the page can be popped
  // (with app bar back button pressed or virtual back button pressed)
  bool canPop(bool isBusy) {
    return isBusy == false;
  }

  Widget getBusyContainer(BuildContext context) {
    return Container(
        color: Theme.of(context)
            .colorScheme
            .surface
            .withAlpha((0.5 * 255).round()));
  }
}
