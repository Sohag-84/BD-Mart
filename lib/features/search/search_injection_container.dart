import 'package:gym_swat/features/search/data/datasource/search_remote_datasource.dart';
import 'package:gym_swat/features/search/data/datasource/search_remote_datasource_impl.dart';
import 'package:gym_swat/features/search/data/repository/search_repository_impl.dart';
import 'package:gym_swat/features/search/domain/repository/search_repository.dart';
import 'package:gym_swat/features/search/domain/usecases/get_search_product_usecase.dart';
import 'package:gym_swat/features/search/domain/usecases/get_search_suggetions_usecase.dart';
import 'package:gym_swat/features/search/presentation/bloc/search_product/search_product_bloc.dart';
import 'package:gym_swat/features/search/presentation/bloc/search_suggetion/search_suggetion_bloc.dart';
import 'package:gym_swat/service_locator.dart';

Future<void> searchInjectionContainer() async {
  //BLOC INJECTION
  sl.registerLazySingleton(
    () => SearchSuggetionBloc(
      searchSuggetionsUsecase: sl.call(),
    ),
  );
  sl.registerLazySingleton(
    () => SearchProductBloc(
      searchProductUsecase: sl.call(),
    ),
  );

  //USECASE INJECTION
  sl.registerLazySingleton<GetSearchSuggetionsUsecase>(
    () => GetSearchSuggetionsUsecase(
      searchRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GetSearchProductUsecase>(
    () => GetSearchProductUsecase(
      searchRepository: sl.call(),
    ),
  );

  //REPOSITORY & DATA SOURCE INJECTION
  sl.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(
      searchRemoteDatasource: sl.call(),
    ),
  );
  sl.registerLazySingleton<SearchRemoteDatasource>(
    () => SearchRemoteDatasourceImpl(
      apiServices: sl.call(),
    ),
  );
}
