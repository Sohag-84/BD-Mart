import 'package:gym_swat/features/policy/data/model/policy_model.dart';

abstract interface class PolicyRemoteDatasource {
  Future<List<PolicyModel>> getPolicy();
  Future<List<PolicyModel>> getTermsAndCondition();
}
