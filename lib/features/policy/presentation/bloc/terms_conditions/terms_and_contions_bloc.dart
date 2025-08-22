import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/features/policy/domain/entity/policy_entity.dart';
import 'package:gym_swat/features/policy/domain/usecases/get_terms_and_conditions_usecase.dart';

part 'terms_and_contions_event.dart';
part 'terms_and_contions_state.dart';

class TermsAndContionsBloc
    extends Bloc<TermsAndContionsEvent, TermsAndContionsState> {
  final GetTermsAndConditionsUsecase getTermsAndConditionsUsecase;

  TermsAndContionsBloc({required this.getTermsAndConditionsUsecase})
      : super(TermsAndContionsInitial()) {
    on<FetchedTermsAndConditions>(_fetchedTermsAndConditions);
  }

  Future<void> _fetchedTermsAndConditions(
    FetchedTermsAndConditions event,
    Emitter<TermsAndContionsState> emit,
  ) async {
    emit(TermsAndContionsLoading());
    final result = await getTermsAndConditionsUsecase.call(NoParams());

    result.fold(
      (error) => emit(
        TermsAndContionsFailure(error: error.message),
      ),
      (data) => emit(
        TermsAndContionsLoaded(policyEntity: data),
      ),
    );
  }
}
