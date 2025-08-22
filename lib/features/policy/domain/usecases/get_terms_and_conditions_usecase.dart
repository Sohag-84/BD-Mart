import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/policy/domain/entity/policy_entity.dart';
import 'package:gym_swat/features/policy/domain/repository/policy_repository.dart';

class GetTermsAndConditionsUsecase
    implements Usecase<List<PolicyEntity>, NoParams> {
  final PolicyRepository policyRepository;
  const GetTermsAndConditionsUsecase({required this.policyRepository});

  @override
  ResultFuture<List<PolicyEntity>> call(NoParams params) async {
    return await policyRepository.getTermsAndCondition();
  }
}
