import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  StreamSubscription<int>? _tickerSubscription;

  final Rx<int> state = 0.obs;

  void startTime({int duration = 90}) {
    _tickerSubscription?.cancel();

    _tickerSubscription = ticker(duration).listen((tick) {
      state.value = tick;
    });
  }
}

Stream<int> ticker(int duration) =>
    Stream.periodic(const Duration(seconds: 1), (tick) => duration - tick - 1)
        .take(duration);
