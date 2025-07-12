import 'package:gym_swat/features/home/data/datasources/home_remote_data_source.dart';
import 'package:gym_swat/features/home/data/datasources/home_remote_data_source_impl.dart';
import 'package:gym_swat/features/home/data/repositories/home_repository_impl.dart';
import 'package:gym_swat/features/home/domain/repositories/home_repository.dart';
import 'package:gym_swat/features/home/domain/usecases/get_sliders_usecase.dart';
import 'package:gym_swat/features/home/presentation/bloc/home_bloc.dart';
import 'package:gym_swat/service_locator.dart';

Future<void> homeInjectionContainer() async {
  //BLOC INJECTION
  sl.registerLazySingleton(
    () => HomeBloc(
      getSlidersUsecase: sl.call(),
    ),
  );

  //USECASE INJECTION
  sl.registerLazySingleton<GetSlidersUsecase>(
    () => GetSlidersUsecase(homeRepository: sl.call()),
  );

  //REPOSITORY & DATA SOURCE INJECTION
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(apiServices: sl.call()),
  );
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: sl.call()),
  );
}
