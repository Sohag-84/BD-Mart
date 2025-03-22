import 'package:get_it/get_it.dart';
import 'package:gym_swat/core/services/api_services.dart';
import 'package:gym_swat/features/home/data/datasources/home_remote_data_source.dart';
import 'package:gym_swat/features/home/data/repositories/home_repository_impl.dart';
import 'package:gym_swat/features/home/domain/repositories/home_repository.dart';
import 'package:gym_swat/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:gym_swat/features/home/presentation/bloc/home_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> setupLocator() async {
  sl.registerLazySingleton<http.Client>(() => http.Client());
  sl.registerLazySingleton<ApiServices>(() => ApiServices());

  // Remote Data Source inject করা
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(client: sl()),
  );

  // Repository inject করা
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: sl()),
  );

  // UseCase inject করা
  sl.registerLazySingleton<GetCategoriesUsecase>(
    () => GetCategoriesUsecase(homeRepository: sl()),
  );

  sl.registerLazySingleton(()=>HomeBloc(getCategoriesUsecase: sl()));
}
