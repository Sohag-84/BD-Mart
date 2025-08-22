import 'package:gym_swat/features/policy/data/datasource/policy_remote_datasource.dart';
import 'package:gym_swat/features/policy/data/datasource/policy_remote_datasource_impl.dart';
import 'package:gym_swat/features/policy/data/repository/policy_repository_impl.dart';
import 'package:gym_swat/features/policy/domain/repository/policy_repository.dart';
import 'package:gym_swat/features/policy/domain/usecases/get_policy_usecase.dart';
import 'package:gym_swat/features/policy/presentation/bloc/policy/policy_bloc.dart';
import 'package:gym_swat/service_locator.dart';

Future<void> policyInjectionContainer() async {
  //BLOC INJECTION
  sl.registerFactory<PolicyBloc>(
    () => PolicyBloc(getPolicyUsecase: sl.call()),
  );

  //USECASE INJECTION
  sl.registerLazySingleton<GetPolicyUsecase>(
    () => GetPolicyUsecase(
      policyRepository: sl.call(),
    ),
  );

  //REPOSITORY & DATA SOURCE INJECTION
  sl.registerLazySingleton<PolicyRepository>(
    () => PolicyRepositoryImpl(
      policyRemoteDatasource: sl.call(),
    ),
  );

  sl.registerLazySingleton<PolicyRemoteDatasource>(
    () => PolicyRemoteDatasourceImpl(apiServices: sl.call()),
  );
}
