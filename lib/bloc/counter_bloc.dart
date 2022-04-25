import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementCounterEvent>((event, emit) => emit(state + 1));

    on<DrecrementCounterEvent>((event, emit) => emit(state - 1));

    on<ByZeroCounterEvent>((event, emit) => emit(state * 0));
  }
}
