import 'dart:async';

import 'package:flutter/material.dart';

import '../../injection_container.dart';
import '../../pages/login/view/login_page.dart';
import 'context_global.dart';

class InactiveLogoutService {
  InactiveLogoutService() {
    handleUserInteraction();
  }
  static const int minutes = 5;

  static const Duration _sleepTime = Duration(minutes: minutes);

  static const int _inactiveThreshold = 30;

  Timer? _inactiveTimer;
  Timer? _sleepTimer;
  DateTime? _closedTime;

  void _initSleepTimer() {
    _sleepTimer = Timer(
      _sleepTime,
      _navigateHome,
    );
  }

  void handleUserInteraction() {
    _inactiveTimer?.cancel();
    _sleepTimer?.cancel();

    _inactiveTimer = Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        if (timer.tick >= _inactiveThreshold) {
          _initSleepTimer();

          timer.cancel();
        }
      },
    );
  }

  void recordCloseTime() {
    _closedTime = DateTime.now();
  }

  void onEnterApp() {
    DateTime _currentTime = DateTime.now();

    if ((_currentTime.difference(_closedTime ?? DateTime.now()).inMinutes) >
        minutes) {
      _navigateHome();
    }
  }

  void _navigateHome() {
    BuildContext context = sl<ContextService>().currentContext!;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute<Widget>(
        builder: (_) => LoginPage(),
      ),
      (_) => false,
    );
  }
}
