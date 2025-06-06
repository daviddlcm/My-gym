part of 'counter_members_cubit.dart';

@immutable
sealed class CounterMembersState {}

final class CounterMembersInitial extends CounterMembersState {}

final class CounterMembersLoading extends CounterMembersState {}
final class CounterMembersLoaded extends CounterMembersState {
  final String num;
  CounterMembersLoaded(this.num);
}

final class CounterMembersError extends CounterMembersState {
  final String message;

  CounterMembersError(this.message);
}
