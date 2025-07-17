import 'package:gym_swat/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:gym_swat/features/auth/data/datasource/auth_remote_datasource_impl.dart';
import 'package:gym_swat/features/auth/data/repository/auth_repository_impl.dart';
import 'package:gym_swat/features/auth/domain/repository/auth_repository.dart';
import 'package:gym_swat/features/auth/domain/usecases/user_login_usecase.dart';
import 'package:gym_swat/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:gym_swat/service_locator.dart';

Future<void> authInjectionContainer() async {
  //BLOC INJECTION
  sl.registerFactory<AuthBloc>(() => AuthBloc(userLoginUsecase: sl.call()));

  //USECASE INJECTION
  sl.registerLazySingleton<UserLoginUsecase>(
    () => UserLoginUsecase(authRepository: sl.call()),
  );

  //REPOSITORY & DATA SOURCE INJECTION
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDatasource: sl.call()),
  );

  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(apiServices: sl.call()),
  );
}
