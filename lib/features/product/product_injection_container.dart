import 'package:gym_swat/core/objectbox/objectbox.dart';
import 'package:gym_swat/features/product/data/datasources/local_datasource/product_local_data_source.dart';
import 'package:gym_swat/features/product/data/datasources/local_datasource/product_local_data_source_impl.dart';
import 'package:gym_swat/features/product/data/datasources/remote_datasource/product_remote_data_source.dart';
import 'package:gym_swat/features/product/data/datasources/remote_datasource/product_remote_data_source_impl.dart';
import 'package:gym_swat/features/product/data/repository/product_repository_impl.dart';
import 'package:gym_swat/features/product/domain/repositories/product_repository.dart';
import 'package:gym_swat/features/product/domain/usecases/get_product_details_usecase.dart';
import 'package:gym_swat/features/product/domain/usecases/get_product_usecase.dart';
import 'package:gym_swat/features/product/domain/usecases/get_related_product_usecase.dart';
import 'package:gym_swat/features/product/presentation/bloc/product/product_bloc.dart';
import 'package:gym_swat/features/product/presentation/bloc/product_details/product_details_bloc.dart';
import 'package:gym_swat/features/product/presentation/bloc/related_product/related_product_bloc.dart';
import 'package:gym_swat/service_locator.dart';

Future<void> productInjectionContainer() async {
  //BLOC INJECTION
  sl.registerLazySingleton(
    () => ProductBloc(
      getProductUsecase: sl.call(),
      connectionChecker: sl.call(),
    ),
  );
  sl.registerLazySingleton(
    () => ProductDetailsBloc(
      productDetailsUsecase: sl.call(),
    ),
  );
  sl.registerLazySingleton(
    () => RelatedProductBloc(
      relatedProductUsecase: sl.call(),
    ),
  );

  //USECASE INJECTION
  sl.registerLazySingleton<GetProductUsecase>(
    () => GetProductUsecase(productRepository: sl.call()),
  );
  sl.registerLazySingleton<GetProductDetailsUsecase>(
    () => GetProductDetailsUsecase(productRepository: sl.call()),
  );
  sl.registerLazySingleton<GetRelatedProductUsecase>(
    () => GetRelatedProductUsecase(productRepository: sl.call()),
  );

  //REPOSITORY & DATA SOURCE INJECTION
  sl.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSourceImpl(productBox: sl<ObjectBox>().productBox));
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(apiServices: sl.call()),
  );

  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      productRemoteDataSource: sl.call(),
      productLocalDataSource: sl.call(),
      connectionChecker: sl.call(),
    ),
  );
}
