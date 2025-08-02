import 'package:gym_swat/features/auth/domain/entities/otp_entity.dart';

class OtpModel extends OtpEntity {
  OtpModel({required super.result, required super.message});

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
      result: json['result'],
      message: json['message'],
    );
  }
}
