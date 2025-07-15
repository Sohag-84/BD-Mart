import 'package:gym_swat/features/product/data/datasources/product_remote_data_source.dart';
import 'package:gym_swat/features/product/data/datasources/product_remote_data_source_impl.dart';
import 'package:gym_swat/features/product/data/repository/product_repository_impl.dart';
import 'package:gym_swat/features/product/domain/repositories/product_repository.dart';
import 'package:gym_swat/features/product/domain/usecases/get_product_details_usecase.dart';
import 'package:gym_swat/features/product/domain/usecases/get_product_usecase.dart';
import 'package:gym_swat/features/product/presentation/bloc/product/product_bloc.dart';
import 'package:gym_swat/features/product/presentation/bloc/product_details/product_details_bloc.dart';
import 'package:gym_swat/service_locator.dart';

Future<void> productInjectionContainer() async {
  //BLOC INJECTION
  sl.registerLazySingleton(
    () => ProductBloc(
      getProductUsecase: sl.call(),
    ),
  );
  sl.registerLazySingleton(
    () => ProductDetailsBloc(
      productDetailsUsecase: sl.call(),
    ),
  );

  //USECASE INJECTION
  sl.registerLazySingleton<GetProductUsecase>(
    () => GetProductUsecase(productRepository: sl.call()),
  );
  sl.registerLazySingleton<GetProductDetailsUsecase>(
    () => GetProductDetailsUsecase(productRepository: sl.call()),
  );

  //REPOSITORY & DATA SOURCE INJECTION
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(productRemoteDataSource: sl.call()),
  );
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(apiServices: sl.call()),
  );
}
