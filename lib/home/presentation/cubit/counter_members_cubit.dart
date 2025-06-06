import 'package:bloc/bloc.dart';
import 'package:frontend_flutter/home/domain/home_use_case.dart';
import 'package:meta/meta.dart';

part 'counter_members_state.dart';

class CounterMembersCubit extends Cubit<CounterMembersState> {
  final HomeUseCase homeUseCases;

  CounterMembersCubit(this.homeUseCases) : super(CounterMembersInitial());

  Future<void> fetchCounterMembers() async {
    try {
      emit(CounterMembersLoading());
      final counterMembers = await homeUseCases.getCounterMembers();
      emit(CounterMembersLoaded(counterMembers.toString()));
    } catch (e) {
      emit(CounterMembersError(e.toString()));
    }
  }
}
