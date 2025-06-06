import 'package:bloc/bloc.dart';
import 'package:frontend_flutter/home/data/models/client_model.dart';
import 'package:frontend_flutter/home/domain/home_use_case.dart';
import 'package:meta/meta.dart';

part 'search_client_state.dart';

class SearchClientCubit extends Cubit<SearchClientState> {
  final HomeUseCase homeUseCases;

  SearchClientCubit(this.homeUseCases) : super(SearchClientInitial());

  Future<void> fetchClients() async {
    try {
      emit(SearchClientLoading());
      final clients = await homeUseCases.call();
      emit(SearchClientLoaded(clients));
    } catch (e) {
      emit(SearchClientError(e.toString()));
    }
  }
}
