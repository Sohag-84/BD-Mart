import 'package:gym_swat/features/cart/data/datasource/cart_remote_datasource.dart';
import 'package:gym_swat/features/cart/data/datasource/cart_remote_datasource_impl.dart';
import 'package:gym_swat/features/cart/data/repository/cart_repository_impl.dart';
import 'package:gym_swat/features/cart/domain/repository/cart_repository.dart';
import 'package:gym_swat/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:gym_swat/features/cart/presentation/bloc/add_to_cart/add_to_cart_bloc.dart';
import 'package:gym_swat/features/cart/presentation/bloc/buy_now/buy_now_bloc.dart';
import 'package:gym_swat/service_locator.dart';

Future<void> cartInjectionContainer() async {
  //BLOC INJECTION
  sl.registerLazySingleton(
    () => AddToCartBloc(
      addToCartUsecase: sl.call(),
    ),
  );
  sl.registerLazySingleton(
    () => BuyNowBloc(
      addToCartUsecase: sl.call(),
    ),
  );

  //USECASE INJECTION
  sl.registerLazySingleton<AddToCartUsecase>(
    () => AddToCartUsecase(
      cartRepository: sl.call(),
    ),
  );

  //REPOSITORY & DATA SOURCE INJECTION
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(
      cartRemoteDatasource: sl.call(),
    ),
  );

  sl.registerLazySingleton<CartRemoteDatasource>(
    () => CartRemoteDatasourceImpl(
      apiServices: sl.call(),
    ),
  );
}
