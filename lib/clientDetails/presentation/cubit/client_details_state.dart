part of 'client_details_cubit.dart';

@immutable
sealed class ClientDetailsState {}

final class ClientDetailsInitial extends ClientDetailsState {}

final class ClientDetailsLoading extends ClientDetailsState {}

final class ClientDetailsLoaded extends ClientDetailsState {
  final Client clientDetails;

  ClientDetailsLoaded(this.clientDetails);
}

final class ClientDetailsError extends ClientDetailsState {
  final String message;

  ClientDetailsError(this.message);
}
