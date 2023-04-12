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
    setState(() {
      _isBusyExpando[this] = isBusy;
    });
  }

  static final _taskCountExpando = Expando<int>();
  int get taskCount => _taskCountExpando[this] ?? 0;
  set taskCount(int value) => _taskCountExpando[this] = value;

  static final _lock = Expando<Lock>();

  Future startBusyContext(Function functionToCall) async {
    try {
      _updateBusyState(1);
      await functionToCall();
    } finally {
      _updateBusyState(-1);
    }
  }

  void _updateBusyState(int count) {
    _lock.synchronized(() {
      taskCount += count;
      isBusy = taskCount > 0;
    });
  }
}
