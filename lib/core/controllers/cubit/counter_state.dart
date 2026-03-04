// ignore_for_file: must_be_immutable

part of 'counter_cubit.dart';

sealed class CounterState extends Equatable {
  int counter;

  CounterState(this.counter);

  @override
  List<Object> get props => [counter];
}

final class CounterInitial extends CounterState {
  CounterInitial() : super(0);
}

final class CounterIncreament extends CounterState {
  CounterIncreament(super.counter);
}

final class CounterDecreament extends CounterState {
  CounterDecreament(super.counter);
}
