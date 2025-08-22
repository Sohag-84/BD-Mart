import 'package:gym_swat/core/config/app_config.dart';
import 'package:gym_swat/core/services/api_services.dart';
import 'package:gym_swat/features/policy/data/datasource/policy_remote_datasource.dart';
import 'package:gym_swat/features/policy/data/model/policy_model.dart';

class PolicyRemoteDatasourceImpl implements PolicyRemoteDatasource {
  final ApiServices apiServices;
  const PolicyRemoteDatasourceImpl({required this.apiServices});

  @override
  Future<List<PolicyModel>> getPolicy() async {
    final response =
        await apiServices.getApi(fullApiUrl: AppConfig.privacyPolicy);

    if (response['data'] != null) {
      final List<dynamic> policies = response['data'];
      return policies.map((json) => PolicyModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<List<PolicyModel>> getTermsAndCondition() async {
    final response =
        await apiServices.getApi(fullApiUrl: AppConfig.termsPolicy);

    if (response['data'] != null) {
      final List<dynamic> termsConditions = response['data'];
      return termsConditions.map((json) => PolicyModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
