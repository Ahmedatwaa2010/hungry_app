import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void increment() {
    emit(CounterIncreament(state.counter + 1));
  }

  void decrement() {
    emit(CounterDecreament(state.counter - 1));
  }
}
