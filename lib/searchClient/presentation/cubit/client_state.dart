part of 'client_cubit.dart';

@immutable
sealed class ClientState {}

final class ClientInitial extends ClientState {}

final class ClientLoading extends ClientState {}

final class ClientLoaded extends ClientState{
  final List<Client> clients;
  ClientLoaded(this.clients);
}

final class ClientError extends ClientState{
  final String message;
  ClientError(this.message);
}
