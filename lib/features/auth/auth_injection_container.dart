import 'package:gym_swat/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:gym_swat/features/auth/data/datasource/auth_remote_datasource_impl.dart';
import 'package:gym_swat/features/auth/data/repository/auth_repository_impl.dart';
import 'package:gym_swat/features/auth/domain/repository/auth_repository.dart';
import 'package:gym_swat/features/auth/domain/usecases/forget_password_confirm_usecase.dart';
import 'package:gym_swat/features/auth/domain/usecases/forget_password_request_usecase.dart';
import 'package:gym_swat/features/auth/domain/usecases/otp_resend_usecase.dart';
import 'package:gym_swat/features/auth/domain/usecases/otp_submit_usecase.dart';
import 'package:gym_swat/features/auth/domain/usecases/user_login_usecase.dart';
import 'package:gym_swat/features/auth/domain/usecases/user_signup_usecase.dart';
import 'package:gym_swat/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:gym_swat/features/auth/presentation/bloc/forget_password/forget_password_bloc.dart';
import 'package:gym_swat/features/auth/presentation/bloc/otp/otp_bloc.dart';
import 'package:gym_swat/service_locator.dart';

Future<void> authInjectionContainer() async {
  //BLOC INJECTION
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      userSignupUsecase: sl.call(),
      userLoginUsecase: sl.call(),
    ),
  );

  sl.registerFactory<OtpBloc>(
    () => OtpBloc(
      otpSubmitUsecase: sl.call(),
      otpResendUsecase: sl.call(),
    ),
  );

  sl.registerFactory<ForgetPasswordBloc>(
    () => ForgetPasswordBloc(
      requestUsecase: sl.call(),
      confirmUsecase: sl.call(),
    ),
  );

  //USECASE INJECTION
  sl.registerLazySingleton<UserLoginUsecase>(
    () => UserLoginUsecase(authRepository: sl.call()),
  );
  sl.registerLazySingleton<UserSignupUsecase>(
    () => UserSignupUsecase(authRepository: sl.call()),
  );
  sl.registerLazySingleton<OtpSubmitUsecase>(
    () => OtpSubmitUsecase(authRepository: sl.call()),
  );
  sl.registerLazySingleton<OtpResendUsecase>(
    () => OtpResendUsecase(authRepository: sl.call()),
  );
  sl.registerLazySingleton<ForgetPasswordRequestUsecase>(
    () => ForgetPasswordRequestUsecase(authRepository: sl.call()),
  );
  sl.registerLazySingleton<ForgetPasswordConfirmUsecase>(
    () => ForgetPasswordConfirmUsecase(authRepository: sl.call()),
  );

  //REPOSITORY & DATA SOURCE INJECTION
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDatasource: sl.call()),
  );

  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(apiServices: sl.call()),
  );
}
