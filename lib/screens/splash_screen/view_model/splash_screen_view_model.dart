import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreenViewModel extends ChangeNotifier  {
  late AnimationController controller;
  late Animation<double> animation;
  late Timer _timer;

  bool isFinished = false;

  void init(State state, TickerProvider vsync, VoidCallback onFinish) {
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: vsync,
    );

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeIn),
    );

    controller.forward();

    _timer = Timer(const Duration(seconds: 4), () {
      isFinished = true;
      notifyListeners();

      if (state.mounted) {
        onFinish();
      }
    });
  }



  Animation<double> get fadeAnimation => animation;

  @override
  void dispose() {
    controller.dispose();
    _timer.cancel();
    super.dispose();
  }
}
