part of 'policy_bloc.dart';

sealed class PolicyState extends Equatable {
  const PolicyState();

  @override
  List<Object> get props => [];
}

final class PolicyInitial extends PolicyState {}

final class PolicyLoading extends PolicyState {}

final class PolicyLoaded extends PolicyState {
  final List<PolicyEntity> policyEntity;
  const PolicyLoaded({required this.policyEntity});

  @override
  List<Object> get props => [policyEntity];
}

final class PolicyFailure extends PolicyState {
  final String error;
  const PolicyFailure({required this.error});

  @override
  List<Object> get props => [error];
}
