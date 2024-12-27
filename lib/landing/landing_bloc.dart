
import 'landing_event.dart';
import 'landing_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc() : super(InitState()) {
    on<LandingEvent>((event, emit) {
      emit(LandingState(page: state.page));
    });
  }
}
