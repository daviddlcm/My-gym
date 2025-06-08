import 'package:bloc/bloc.dart';
import 'package:frontend_flutter/clientDetails/data/models/client.dart';
import 'package:frontend_flutter/clientDetails/domain/client_details_use_cases.dart';
import 'package:meta/meta.dart';

part 'client_details_state.dart';

class ClientDetailsCubit extends Cubit<ClientDetailsState> {
  final ClientDetailsUseCases clientDetailsUseCases;
  ClientDetailsCubit(this.clientDetailsUseCases) : super(ClientDetailsInitial());
  
  Future<void> fetchClientById(String id) async {
    try {
      emit(ClientDetailsLoading());
      final client = await clientDetailsUseCases.getClientById(id);
      print("Client fetched: $client");
      emit(ClientDetailsLoaded(client));
    } catch (e) {
      emit(ClientDetailsError(e.toString()));
    }
  }
}
