import 'dart:async';

import 'package:bloc/bloc.dart';

class TimerCubit extends Cubit<int> {
  TimerCubit() : super(0);

  StreamSubscription<int>? _tickerSubscription;

  void startTime({int duration = 90}) {
    _tickerSubscription?.cancel();

    _tickerSubscription = ticker(duration).listen((tick) {
      emit(tick);
    });
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();

    return super.close();
  }
}

Stream<int> ticker(int duration) =>
    Stream.periodic(const Duration(seconds: 1), (tick) => duration - tick - 1)
        .take(duration);
