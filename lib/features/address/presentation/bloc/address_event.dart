part of 'address_bloc.dart';

sealed class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

final class AddShippingAddress extends AddressEvent {
  final String address;
  final String postalCode;
  final String phoneNumber;
  final int cityId;
  final int stateId;

  const AddShippingAddress({
    required this.address,
    required this.postalCode,
    required this.phoneNumber,
    required this.cityId,
    required this.stateId,
  });

  @override
  List<Object> get props => [
        address,
        postalCode,
        phoneNumber,
        cityId,
        stateId,
      ];
}

final class FetchedShippingAddress extends AddressEvent {}

final class DeleteShippingAddress extends AddressEvent {
  final int addressId;
  const DeleteShippingAddress({required this.addressId});

  @override
  List<Object> get props => [addressId];
}
