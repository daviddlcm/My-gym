part of 'client_update_cubit.dart';

@immutable
sealed class ClientUpdateState {}

final class ClientUpdateInitial extends ClientUpdateState {}

final class ClientUpdateLoading extends ClientUpdateState {}
final class ClientUpdateSuccess extends ClientUpdateState {
  final ClientUpdateResponse response;

  ClientUpdateSuccess(this.response);
}

final class ClientUpdateError extends ClientUpdateState {
  final String message;

  ClientUpdateError(this.message);
}
