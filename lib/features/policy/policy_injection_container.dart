import 'package:gym_swat/features/policy/data/datasource/policy_remote_datasource.dart';
import 'package:gym_swat/features/policy/data/datasource/policy_remote_datasource_impl.dart';
import 'package:gym_swat/features/policy/data/repository/policy_repository_impl.dart';
import 'package:gym_swat/features/policy/domain/repository/policy_repository.dart';
import 'package:gym_swat/features/policy/domain/usecases/get_policy_usecase.dart';
import 'package:gym_swat/features/policy/domain/usecases/get_terms_and_conditions_usecase.dart';
import 'package:gym_swat/features/policy/presentation/bloc/policy/policy_bloc.dart';
import 'package:gym_swat/features/policy/presentation/bloc/terms_conditions/terms_and_contions_bloc.dart';
import 'package:gym_swat/service_locator.dart';

Future<void> policyInjectionContainer() async {
  //BLOC INJECTION
  sl.registerFactory<PolicyBloc>(
    () => PolicyBloc(getPolicyUsecase: sl.call()),
  );
  sl.registerFactory<TermsAndContionsBloc>(
    () => TermsAndContionsBloc(
      getTermsAndConditionsUsecase: sl.call(),
    ),
  );

  //USECASE INJECTION
  sl.registerLazySingleton<GetPolicyUsecase>(
    () => GetPolicyUsecase(
      policyRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GetTermsAndConditionsUsecase>(
    () => GetTermsAndConditionsUsecase(
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
