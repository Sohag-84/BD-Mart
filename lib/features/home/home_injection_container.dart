import 'package:gym_swat/features/home/data/datasources/home_remote_data_source.dart';
import 'package:gym_swat/features/home/data/repositories/home_repository_impl.dart';
import 'package:gym_swat/features/home/domain/repositories/home_repository.dart';
import 'package:gym_swat/features/home/domain/usecases/get_home_categories_usecase.dart';
import 'package:gym_swat/features/home/domain/usecases/get_sliders_usecase.dart';
import 'package:gym_swat/features/home/presentation/bloc/home_bloc.dart';
import 'package:gym_swat/features/product/data/datasources/product_remote_data_source.dart';
import 'package:gym_swat/features/product/data/repository/product_repository_impl.dart';
import 'package:gym_swat/features/product/domain/repositories/product_repository.dart';
import 'package:gym_swat/features/product/domain/usecases/get_product_usecase.dart';
import 'package:gym_swat/features/product/presentation/bloc/product_bloc.dart';
import 'package:gym_swat/service_locator.dart';

Future<void> homeInjectionContainer() async {
  // Remote Data Source inject
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(),
  );

  // Repository inject
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(productRemoteDataSource: sl()),
  );

  // UseCase inject
  sl.registerLazySingleton<GetHomeCategoriesUsecase>(
    () => GetHomeCategoriesUsecase(homeRepository: sl()),
  );
  sl.registerLazySingleton<GetSlidersUsecase>(
    () => GetSlidersUsecase(homeRepository: sl()),
  );
  sl.registerLazySingleton<GetProductUsecase>(
    () => GetProductUsecase(productRepository: sl()),
  );

  // Bloc inject
  sl.registerLazySingleton(
    () => HomeBloc(
      getCategoriesUsecase: sl(),
      getSlidersUsecase: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => ProductBloc(
      getProductUsecase: sl(),
    ),
  );
}
