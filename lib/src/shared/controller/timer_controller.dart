import 'dart:async';

import 'package:flutter/material.dart';

class TimerController extends ValueNotifier<int> {
  final int maxValue;
  final VoidCallback? onComplete;
  TimerController(this.maxValue, [this.onComplete]) : super(maxValue) {
    startTimer();
  }
  bool get isWorking => _currentTimer != null;
  Timer? _currentTimer;
  startTimer() {
    canecl();
    value = maxValue;
    _currentTimer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      value = maxValue - timer.tick;
      if (timer.tick > maxValue) {
        timer.cancel();
        onComplete?.call();
        value = 0;
        _currentTimer = null;
      }
    });
  }

  canecl() {
    _currentTimer?.cancel();
  }
}
