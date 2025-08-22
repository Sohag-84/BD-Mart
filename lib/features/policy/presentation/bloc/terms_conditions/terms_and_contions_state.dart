part of 'terms_and_contions_bloc.dart';

sealed class TermsAndContionsState extends Equatable {
  const TermsAndContionsState();

  @override
  List<Object> get props => [];
}

final class TermsAndContionsInitial extends TermsAndContionsState {}

final class TermsAndContionsLoading extends TermsAndContionsState {}

final class TermsAndContionsLoaded extends TermsAndContionsState {
  final List<PolicyEntity> policyEntity;
  const TermsAndContionsLoaded({required this.policyEntity});

  @override
  List<Object> get props => [policyEntity];
}

final class TermsAndContionsFailure extends TermsAndContionsState {
  final String error;
  const TermsAndContionsFailure({required this.error});

  @override
  List<Object> get props => [error];
}
