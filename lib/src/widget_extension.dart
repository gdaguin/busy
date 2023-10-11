import 'package:busy/packages/synchronized-3.0.1/extension.dart';
import 'package:busy/packages/synchronized-3.0.1/synchronized.dart';
import 'package:flutter/material.dart';

extension BusyWidgetExtension on Widget {
  static final _isBusyExpando = Expando<bool>();
  bool get isBusy => _isBusyExpando[this] ?? false;
  bool get isNotBusy => !isBusy;
  set isBusy(bool isBusy) {
    _isBusyExpando[this] = isBusy;
  }

  static final _taskCountExpando = Expando<int>();
  int get taskCount => _taskCountExpando[this] ?? 0;
  set taskCount(int value) => _taskCountExpando[this] = value;

  static final _lock = Expando<Lock>();

  Future startBusyContext({
    required Function functionToCall,
    required Function(bool) isBusyValueChanged,
  }) async {
    try {
      _updateBusyState(1, isBusyValueChanged);
      await functionToCall();
    } finally {
      _updateBusyState(-1, isBusyValueChanged);
    }
  }

  void _updateBusyState(int count, Function(bool) isBusyValueChanged) {
    _lock.synchronized(() {
      taskCount += count;
      isBusy = taskCount > 0;
      isBusyValueChanged(isBusy);
    });
  }
}
