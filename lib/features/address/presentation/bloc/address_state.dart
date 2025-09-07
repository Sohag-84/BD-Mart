part of 'address_bloc.dart';

sealed class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

final class AddressInitial extends AddressState {}

final class AddressLoading extends AddressState {}

final class AddressLoaded extends AddressState {
  final List<AddressEntity> shippingAddressList;
  const AddressLoaded({required this.shippingAddressList});

  @override
  List<Object> get props => [shippingAddressList];
}

final class AddressFailure extends AddressState {
  final String error;
  const AddressFailure({required this.error});

  @override
  List<Object> get props => [error];
}

final class AddAddressLoading extends AddressState {}

final class AddAddressSuccess extends AddressState {
  final String message;
  const AddAddressSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

final class AddAddressFailure extends AddressState {
  final String error;
  const AddAddressFailure({required this.error});

  @override
  List<Object> get props => [error];
}
