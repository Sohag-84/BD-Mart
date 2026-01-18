import 'package:gym_swat/core/objectbox/objectbox.dart';
import 'package:gym_swat/features/category/data/datasource/local/category_local_datasource.dart';
import 'package:gym_swat/features/category/data/datasource/local/category_local_datasource_impl.dart';
import 'package:gym_swat/features/category/data/datasource/remote/category_remote_datasource.dart';
import 'package:gym_swat/features/category/data/datasource/remote/category_remote_datasource_impl.dart';
import 'package:gym_swat/features/category/data/repository/category_repository_impl.dart';
import 'package:gym_swat/features/category/domain/repository/category_repository.dart';
import 'package:gym_swat/features/category/domain/usecase/category_usecase.dart';
import 'package:gym_swat/features/category/presentation/bloc/all_category/all_category_bloc.dart';
import 'package:gym_swat/features/category/presentation/bloc/category/category_bloc.dart';
import 'package:gym_swat/features/category/presentation/bloc/feature_category/feature_category_bloc.dart';
import 'package:gym_swat/features/category/presentation/bloc/sub_category/sub_category_bloc.dart';
import 'package:gym_swat/service_locator.dart';

Future<void> categoryInjectionContainer() async {
  //BLOC INJECTION
  sl.registerFactory<CategoryBloc>(
    () => CategoryBloc(categoryUsecase: sl.call()),
  );
  sl.registerFactory<FeatureCategoryBloc>(
    () => FeatureCategoryBloc(categoryUsecase: sl.call()),
  );
  sl.registerFactory<SubCategoryBloc>(
    () => SubCategoryBloc(categoryUsecase: sl.call()),
  );
  sl.registerFactory<AllCategoryBloc>(
    () => AllCategoryBloc(categoryUsecase: sl.call()),
  );

  //USECASE INJECTION
  sl.registerLazySingleton<CategoryUsecase>(
    () => CategoryUsecase(categoryRepository: sl.call()),
  );

  //REPOSITORY & DATA SOURCE INJECTION
  sl.registerLazySingleton<CategoryRemoteDatasource>(
    () => CategoryRemoteDatasourceImpl(apiServices: sl.call()),
  );

  sl.registerLazySingleton<CategoryLocalDatasource>(
    () => CategoryLocalDatasourceImpl(categoryBox: sl<ObjectBox>().categoryBox),
  );

  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(
        categoryRemoteDatasource: sl.call(),
        categoryLocalDatasource: sl.call(),
        connectionChecker: sl.call()),
  );
}
