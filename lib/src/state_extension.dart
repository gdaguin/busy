import 'package:busy/packages/synchronized-3.0.1/extension.dart';
import 'package:busy/packages/synchronized-3.0.1/synchronized.dart';
import 'package:flutter/material.dart';

extension BusyStatefulWidget<T extends StatefulWidget> on State<T> {
  static final _isBusyExpando = Expando<bool>();
  bool get isBusy => _isBusyExpando[this] ?? false;
  bool get isNotBusy => !isBusy;
  set isBusy(bool isBusy) {
    if (mounted == false) {
      return;
    }
    // ignore: INVALID_USE_OF_PROTECTED_MEMBER
    setState(() {
      _isBusyExpando[this] = isBusy;
    });
  }

  static final _taskCountExpando = Expando<int>();
  int get taskCount => _taskCountExpando[this] ?? 0;
  set taskCount(int value) => _taskCountExpando[this] = value;

  static final _lock = Expando<Lock>();

  Future startBusyContext(
    Function functionToCall, {
    Function(bool)? isBusyValueChanged,
  }) async {
    try {
      _updateBusyState(1, isBusyValueChanged: isBusyValueChanged);
      await functionToCall();
    } finally {
      _updateBusyState(-1, isBusyValueChanged: isBusyValueChanged);
    }
  }

  void _updateBusyState(int count, {Function(bool)? isBusyValueChanged}) {
    _lock.synchronized(() {
      taskCount += count;
      isBusy = taskCount > 0;
      isBusyValueChanged?.call(isBusy);
    });
  }
}
