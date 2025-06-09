part of 'cliente_delete_cubit.dart';

@immutable
sealed class ClienteDeleteState {}

final class ClienteDeleteInitial extends ClienteDeleteState {}

final class ClienteDeleteLoading extends ClienteDeleteState {}

final class ClienteDeleteSuccess extends ClienteDeleteState {
  final ClientDeleteResponse isDeleted;

  ClienteDeleteSuccess(this.isDeleted);
}

final class ClienteDeleteError extends ClienteDeleteState {
  final String message;

  ClienteDeleteError(this.message);
}