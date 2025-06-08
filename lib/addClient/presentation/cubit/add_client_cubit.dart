import 'package:bloc/bloc.dart';
import 'package:frontend_flutter/addClient/data/models/add_client_request.dart';
import 'package:frontend_flutter/addClient/domain/add_client_use_cases.dart';
import 'package:meta/meta.dart';

part 'add_client_state.dart';

class AddClientCubit extends Cubit<AddClientState> {
  final AddClientUseCases addClientUseCases;

  AddClientCubit(this.addClientUseCases) : super(AddClientInitial());

  Future<void> addClient( String fullName, String email, String phoneNumber, String address,String membership, int lastVisit) async {
    try {
      emit(AddClientLoading());
      final addClientRequest = AddClientRequest(
        email: email,
        full_name: fullName,
        phone_number: phoneNumber,
        address: address,
        membership: membership,
        last_visit:lastVisit
      );
      final response = await addClientUseCases.call(addClientRequest);
      print('Response from addClientUseCases: $response');
      if (response != null) {
        emit(AddClientSuccess(response.success ?? false));
      } else {
        emit(AddClientError('Adding client failed: response is null'));
      }
    } catch (e) {
      emit(AddClientError(e.toString()));
    }
  }
}
