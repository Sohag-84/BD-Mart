import 'package:gym_swat/features/order_status/data/datasource/order_status_remote_datasource.dart';
import 'package:gym_swat/features/order_status/data/datasource/order_status_remote_datasource_impl.dart';
import 'package:gym_swat/features/order_status/data/repository/order_status_repository_impl.dart';
import 'package:gym_swat/features/order_status/domain/repository/order_status_repository.dart';
import 'package:gym_swat/features/order_status/domain/usecases/get_all_order_usecase.dart';
import 'package:gym_swat/features/order_status/domain/usecases/track_order_usecase.dart';
import 'package:gym_swat/features/order_status/presentation/bloc/order_status_bloc.dart';
import 'package:gym_swat/service_locator.dart';

Future<void> orderStatusInjectionContainer() async {
  //BLOC INJECTION
  sl.registerLazySingleton(
    () => OrderStatusBloc(
      allOrderUsecase: sl.call(),
      trackOrderUsecase: sl.call(),
    ),
  );

  //USECASE INJECTION
  sl.registerLazySingleton<GetAllOrderUsecase>(
    () => GetAllOrderUsecase(orderStatusRepository: sl.call()),
  );
  sl.registerLazySingleton<TrackOrderUsecase>(
    () => TrackOrderUsecase(orderStatusRepository: sl.call()),
  );

  //REPOSITORY & DATA SOURCE INJECTION
  sl.registerLazySingleton<OrderStatusRepository>(
    () => OrderStatusRepositoryImpl(
      orderStatusRemoteDatasource: sl.call(),
    ),
  );
  sl.registerLazySingleton<OrderStatusRemoteDatasource>(
    () => OrderStatusRemoteDatasourceImpl(
      apiServices: sl.call(),
    ),
  );
}
