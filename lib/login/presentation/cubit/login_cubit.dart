import 'package:bloc/bloc.dart';
import 'package:frontend_flutter/core/network/api_service.dart';
import 'package:frontend_flutter/login/data/models/login_model_resquest.dart';
import 'package:frontend_flutter/login/domain/login_use_cases.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  
  final LoginUseCases loginUseCases;

  LoginCubit(this.loginUseCases) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    try {
      emit(LoginLoading());
      LoginRequest loginRequest = LoginRequest(email: email, password: password);
      final response = await loginUseCases.call(loginRequest);
      if (response != null) {
        emit(LoginSuccess(response.token));
         ApiService.setToken(response.token);
      } else {
        emit(LoginError('Login failed: response is null'));
      }
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

}
