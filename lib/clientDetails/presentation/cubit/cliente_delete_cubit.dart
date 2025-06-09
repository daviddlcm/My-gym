import 'package:bloc/bloc.dart';
import 'package:frontend_flutter/clientDetails/data/models/client_delete_response.dart';
import 'package:frontend_flutter/clientDetails/domain/client_details_use_cases.dart';
import 'package:frontend_flutter/clientDetails/presentation/cubit/client_details_cubit.dart';
import 'package:meta/meta.dart';

part 'cliente_delete_state.dart';

class ClienteDeleteCubit extends Cubit<ClienteDeleteState> {
  final ClientDetailsUseCases clientDetailsCubit;
  ClienteDeleteCubit(this.clientDetailsCubit) : super(ClienteDeleteInitial());

  Future<void> deleteClientById(String id) async {
    try {
      emit(ClienteDeleteLoading());
      final isDeleted = await clientDetailsCubit.deleteClientById(id);
      //print("Client deleted: $isDeleted");
      emit(ClienteDeleteSuccess(isDeleted));
    } catch (e) {
      emit(ClienteDeleteError(e.toString()));
    }
  }
}
