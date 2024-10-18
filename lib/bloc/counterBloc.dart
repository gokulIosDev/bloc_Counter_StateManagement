import 'package:bloc_sample_project/bloc/counterEvents.dart';
import 'package:bloc_sample_project/bloc/counterState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    on<IncrementEvents>((event, emit) {
      emit(CounterState(count: state.count + 1));
    });

    on<DecrementEvents>((event, emit) {
      if (state.count > 0) {
        emit(CounterState(count: state.count - 1));
      }
    });
  }
}
