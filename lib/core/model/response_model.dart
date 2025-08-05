import 'package:gym_swat/core/entity/response_entity.dart';

class ResponseModel extends ResponseEntity {
  ResponseModel({required super.result, required super.message});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      result: json['result'],
      message: json['message'],
    );
  }
}
