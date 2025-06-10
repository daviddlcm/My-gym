import 'package:bloc/bloc.dart';
import 'package:frontend_flutter/clientDetails/data/models/client_update_request.dart';
import 'package:frontend_flutter/clientDetails/data/models/client_update_response.dart';
import 'package:frontend_flutter/clientDetails/domain/client_details_use_cases.dart';
import 'package:meta/meta.dart';

part 'client_update_state.dart';

class ClientUpdateCubit extends Cubit<ClientUpdateState> {
  ClientDetailsUseCases clientDetailsUseCases;
  ClientUpdateCubit(this.clientDetailsUseCases) : super(ClientUpdateInitial());

  Future<void> updateClient(String id, String name, String email, String phone, String address, String membership) async {
    try {
      emit(ClientUpdateLoading());
      final client = ClientUpdateRequest(
        name: name,
        email: email,
        phoneNumber: phone,
        address: address,
        membershipType: membership,
      );
      final response = await clientDetailsUseCases.updateClient(id, client);
      emit(ClientUpdateSuccess(response));
    } catch (e) {
      emit(ClientUpdateError(e.toString()));
    }
  }
}
