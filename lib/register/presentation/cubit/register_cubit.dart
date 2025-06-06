import 'package:bloc/bloc.dart';
import 'package:frontend_flutter/register/data/models/register_request_model.dart';
import 'package:frontend_flutter/register/domain/register_usecases.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecases registerUsecases;
  RegisterCubit(this.registerUsecases) : super(RegisterInitial());

  Future<void> registerUser(String email, String fullName,String password)async {
    try {
      emit(RegisterLoading());
      final registerRequest = RegisterRequestModel(
        email: email,
        full_name: fullName,
        password: password,
      );
      final response = await registerUsecases.call(registerRequest);
      print('Response from registerUsecases: $response');
      if (response != null) {
        emit(RegisterSuccess(response.success ?? false));
      } else {
        emit(RegisterError('Registration failed: response is null'));
      }
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
}
