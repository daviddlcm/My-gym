part of 'add_client_cubit.dart';

@immutable
sealed class AddClientState {}

final class AddClientInitial extends AddClientState {}

final class AddClientLoading extends AddClientState {}
final class AddClientSuccess extends AddClientState {
  final bool success;

  AddClientSuccess(this.success);
}
final class AddClientError extends AddClientState {
  final String message;

  AddClientError(this.message);
}
