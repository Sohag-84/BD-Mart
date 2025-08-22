import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/features/policy/domain/entity/policy_entity.dart';
import 'package:gym_swat/features/policy/domain/usecases/get_policy_usecase.dart';

part 'policy_event.dart';
part 'policy_state.dart';

class PolicyBloc extends Bloc<PolicyEvent, PolicyState> {
  final GetPolicyUsecase getPolicyUsecase;
  PolicyBloc({required this.getPolicyUsecase}) : super(PolicyInitial()) {
    on<PolicyEvent>((event, emit) {});

    on<FetchedPolicy>(_fetchedPolicy);
  }

  Future<void> _fetchedPolicy(
      FetchedPolicy event, Emitter<PolicyState> emit) async {
    emit(PolicyLoading());
    final result = await getPolicyUsecase.call(NoParams());

    result.fold(
      (error) => emit(
        PolicyFailure(error: error.message),
      ),
      (policy) => emit(
        PolicyLoaded(policyEntity: policy),
      ),
    );
  }
}
