part of 'terms_and_contions_bloc.dart';

sealed class TermsAndContionsEvent extends Equatable {
  const TermsAndContionsEvent();

  @override
  List<Object> get props => [];
}

final class FetchedTermsAndConditions extends TermsAndContionsEvent {}
