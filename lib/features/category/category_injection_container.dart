import 'package:gym_swat/features/category/data/datasource/category_remote_datasource.dart';
import 'package:gym_swat/features/category/data/datasource/category_remote_datasource_impl.dart';
import 'package:gym_swat/features/category/data/repository/category_repository_impl.dart';
import 'package:gym_swat/features/category/domain/repository/category_repository.dart';
import 'package:gym_swat/features/category/domain/usecase/category_usecase.dart';
import 'package:gym_swat/features/category/presentation/bloc/category_bloc.dart';
import 'package:gym_swat/service_locator.dart';

Future<void> categoryInjectionContainer() async {
  //BLOC INJECTION
  sl.registerFactory<CategoryBloc>(
    () => CategoryBloc(categoryUsecase: sl.call()),
  );

  //USECASE INJECTION
  sl.registerLazySingleton<CategoryUsecase>(
    () => CategoryUsecase(categoryRepository: sl.call()),
  );

  //REPOSITORY & DATA SOURCE INJECTION
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(categoryRemoteDatasource: sl.call()),
  );

  sl.registerLazySingleton<CategoryRemoteDatasource>(
    () => CategoryRemoteDatasourceImpl(apiServices: sl.call()),
  );
}
