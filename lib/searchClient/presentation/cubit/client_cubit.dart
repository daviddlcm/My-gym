import 'package:bloc/bloc.dart';
import 'package:frontend_flutter/searchClient/data/models/client_model.dart';
import 'package:frontend_flutter/searchClient/domain/client_use_cases.dart';
import 'package:meta/meta.dart';

part 'client_state.dart';

class ClientCubit extends Cubit<ClientState> {

  final GetClientsById getClientsById;

  ClientCubit(this.getClientsById) : super(ClientInitial());

  Future<void> fetchClients(String id)async{
    try{
      emit(ClientLoading());
      final clients = await getClientsById(id);
      emit(ClientLoaded(clients));
    }catch(e){
      emit(ClientError(id));
    }
  }
}
