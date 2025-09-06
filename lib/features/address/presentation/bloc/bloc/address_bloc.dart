import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/features/address/domain/entities/shipping_address_entity.dart';
import 'package:gym_swat/features/address/domain/usecases/add_shipping_address_usecase.dart';
import 'package:gym_swat/features/address/domain/usecases/get_shipping_address_usecase.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddShippingAddressUsecase addShippingAddressUsecase;
  final GetShippingAddressUsecase getShippingAddressUsecase;

  AddressBloc({
    required this.addShippingAddressUsecase,
    required this.getShippingAddressUsecase,
  }) : super(AddressInitial()) {
    on<AddShippingAddress>(_addShippingAddress);
    on<FetchedShippingAddress>(_fetchedShippingAddress);
  }

  Future<void> _addShippingAddress(
    AddShippingAddress event,
    Emitter<AddressState> emit,
  ) async {
    final result = await addShippingAddressUsecase.call(
      AddAddressParams(
        address: event.address,
        postalCode: event.postalCode,
        phoneNumber: event.phoneNumber,
        cityId: event.cityId,
        stateId: event.stateId,
      ),
    );
    result.fold(
      (error) => emit(AddAddressFailure(error: error.message)),
      (message) => emit(AddAddressSuccess(message: message)),
    );
  }

  Future<void> _fetchedShippingAddress(
    FetchedShippingAddress event,
    Emitter<AddressState> emit,
  ) async {
    emit(AddressLoading());
    final result = await getShippingAddressUsecase.call(NoParams());

    result.fold(
      (error) => emit(
        AddAddressFailure(error: error.message),
      ),
      (addressList) => emit(
        AddressLoaded(shippingAddressList: addressList),
      ),
    );
  }
}
