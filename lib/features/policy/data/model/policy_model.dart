import 'package:gym_swat/features/policy/domain/entity/policy_entity.dart';

class PolicyModel extends PolicyEntity {
  PolicyModel({
    required super.title,
    required super.content,
  });

  factory PolicyModel.fromJson(Map<String, dynamic> json) {
    return PolicyModel(
      title: json['title'],
      content: json['content'],
    );
  }
}
