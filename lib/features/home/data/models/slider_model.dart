import 'package:gym_swat/features/home/domain/entity/slider_entity.dart';

class SliderModel extends SliderEntity {
  SliderModel({required super.photo});

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      photo: json['photo'],
    );
  }
}
