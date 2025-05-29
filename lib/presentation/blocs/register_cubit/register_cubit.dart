import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    print('Submit $state');
  }

  void username(String vale) {
    emit(state.copyWith(username: vale));
  }

  void email(String vale) {
    emit(state.copyWith(email: vale));
  }

  void password(String vale) {
    emit(state.copyWith(password: vale));
  }
}
