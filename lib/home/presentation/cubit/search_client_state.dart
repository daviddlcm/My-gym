part of 'search_client_cubit.dart';

@immutable
sealed class SearchClientState {}

final class SearchClientInitial extends SearchClientState {}
final class SearchClientLoading extends SearchClientState {}
final class SearchClientLoaded extends SearchClientState {
  final List<Client> clients;

  SearchClientLoaded(this.clients);
}
final class SearchClientError extends SearchClientState {
  final String message;

  SearchClientError(this.message);
}
