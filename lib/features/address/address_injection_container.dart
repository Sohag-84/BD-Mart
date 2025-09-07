import 'package:gym_swat/features/address/data/datasource/shipping_address_remote_datasource.dart';
import 'package:gym_swat/features/address/data/datasource/shipping_address_remote_datasource_impl.dart';
import 'package:gym_swat/features/address/data/repository/shipping_address_repository_impl.dart';
import 'package:gym_swat/features/address/domain/repository/address_repository.dart';
import 'package:gym_swat/features/address/domain/usecases/add_shipping_address_usecase.dart';
import 'package:gym_swat/features/address/domain/usecases/delete_shipping_address_usecase.dart';
import 'package:gym_swat/features/address/domain/usecases/get_shipping_address_usecase.dart';
import 'package:gym_swat/features/address/domain/usecases/update_shipping_address_usecase.dart';
import 'package:gym_swat/features/address/presentation/bloc/address_bloc.dart';

import 'package:gym_swat/service_locator.dart';

Future<void> addressInjectionContainer() async {
  //BLOC INJECTION
  sl.registerLazySingleton(
    () => AddressBloc(
      addShippingAddressUsecase: sl.call(),
      getShippingAddressUsecase: sl.call(),
    ),
  );

  //USECASE INJECTION
  sl.registerLazySingleton<GetShippingAddressUsecase>(
    () => GetShippingAddressUsecase(addressRepository: sl.call()),
  );
  sl.registerLazySingleton<AddShippingAddressUsecase>(
    () => AddShippingAddressUsecase(addressRepository: sl.call()),
  );
  sl.registerLazySingleton<UpdateShippingAddressUsecase>(
    () => UpdateShippingAddressUsecase(addressRepository: sl.call()),
  );
  sl.registerLazySingleton<DeleteShippingAddressUsecase>(
    () => DeleteShippingAddressUsecase(addressRepository: sl.call()),
  );

  //REPOSITORY & DATA SOURCE INJECTION
  sl.registerLazySingleton<AddressRepository>(
    () => ShippingAddressRepositoryImpl(
      shippingAddressRemoteDatasource: sl.call(),
    ),
  );

  sl.registerLazySingleton<ShippingAddressRemoteDatasource>(
    () => ShippingAddressRemoteDatasourceImpl(
      apiServices: sl.call(),
    ),
  );
}
