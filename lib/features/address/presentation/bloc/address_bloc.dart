import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/features/address/domain/entities/shipping_address_entity.dart';
import 'package:gym_swat/features/address/domain/usecases/add_shipping_address_usecase.dart';
import 'package:gym_swat/features/address/domain/usecases/delete_shipping_address_usecase.dart';
import 'package:gym_swat/features/address/domain/usecases/get_shipping_address_usecase.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddShippingAddressUsecase addShippingAddressUsecase;
  final GetShippingAddressUsecase getShippingAddressUsecase;
  DeleteShippingAddressUsecase deleteShippingAddressUsecase;

  AddressBloc({
    required this.addShippingAddressUsecase,
    required this.getShippingAddressUsecase,
    required this.deleteShippingAddressUsecase,
  }) : super(AddressInitial()) {
    on<AddShippingAddress>(_addShippingAddress);
    on<FetchedShippingAddress>(_fetchedShippingAddress);
    on<DeleteShippingAddress>(_deleteShippingAddress);

    on<SelectShippingAddress>((event, emit) {
  if (state is AddressLoaded) {
    final currentState = state as AddressLoaded;
    emit(currentState.copyWith(selectedAddressId: event.addressId));
  }
});

  }

  Future<void> _addShippingAddress(
    AddShippingAddress event,
    Emitter<AddressState> emit,
  ) async {
    emit(AddAddressLoading());
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

  Future<void> _deleteShippingAddress(
    DeleteShippingAddress event,
    Emitter<AddressState> emit,
  ) async {
    AddressLoaded? currentState;
    if (state is AddressLoaded) {
      currentState = state as AddressLoaded;
    } else {
      final result = await getShippingAddressUsecase.call(NoParams());

      currentState = result.fold(
        (error) {
          emit(AddAddressFailure(error: error.message));
          return null;
        },
        (addressList) =>
            currentState = AddressLoaded(shippingAddressList: addressList),
      );
    }

    if (currentState == null || currentState!.shippingAddressList.isEmpty) {
      return;
    }

    emit(
      AddressLoaded(
        shippingAddressList: currentState!.shippingAddressList,
        isUpdating: true,
      ),
    );

    final result = await deleteShippingAddressUsecase.call(
      DeleteAddressParams(
        id: event.addressId,
      ),
    );

    result.fold(
      (error) {
        emit(DeleteAddressFailure(error: error.message));
        emit(
          AddressLoaded(
            shippingAddressList: currentState!.shippingAddressList,
            isUpdating: false,
          ),
        );
      },
      (message) {
        final updateList = currentState!.shippingAddressList
            .where((address) => address.id != event.addressId)
            .toList();
        emit(AddressLoaded(shippingAddressList: updateList, isUpdating: false));
      },
    );
  }
}
