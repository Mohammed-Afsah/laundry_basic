import 'package:bloc/bloc.dart';
import 'package:laundry/signin_page/sign_in_event.dart';
import 'package:laundry/signin_page/sign_in_state.dart';
import 'package:meta/meta.dart';


class SignInBloc extends Bloc<SignInEvent, SigninState> {
  SignInBloc() : super(const SigninState()) {
    on<EmailEvent>(_emailEvent);
    on<passwordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SigninState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(passwordEvent event, Emitter<SigninState> emit) {
    emit(state.copyWith(password: event.password));
  }

}
