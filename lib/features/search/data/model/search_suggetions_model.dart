import 'package:gym_swat/features/search/domain/entity/search_suggetions_entity.dart';

class SearchSuggetionsModel extends SearchSuggetionsEntity {
  SearchSuggetionsModel({
    required super.id,
    required super.query,
    required super.count,
    required super.type,
    required super.typeString,
  });

  factory SearchSuggetionsModel.fromJson(Map<String, dynamic> json) {
    return SearchSuggetionsModel(
      id: json["id"],
      query: json["query"],
      count: json["count"],
      type: json["type"],
      typeString: json["type_string"],
    );
  }
}
