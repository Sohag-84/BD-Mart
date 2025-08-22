import 'package:equatable/equatable.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/features/policy/domain/entity/policy_entity.dart';

part 'terms_and_contions_event.dart';
part 'terms_and_contions_state.dart';

class TermsAndContionsBloc
    extends Bloc<TermsAndContionsEvent, TermsAndContionsState> {
  TermsAndContionsBloc() : super(TermsAndContionsInitial()) {
    on<TermsAndContionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
