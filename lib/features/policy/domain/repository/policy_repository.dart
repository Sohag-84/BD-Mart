import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/policy/domain/entity/policy_entity.dart';

abstract interface class PolicyRepository {
  ResultFuture<List<PolicyEntity>> getPolicy();
  ResultFuture<List<PolicyEntity>> getTermsAndCondition();
}
