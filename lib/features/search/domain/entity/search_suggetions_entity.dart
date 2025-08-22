class SearchSuggetionsEntity {
  SearchSuggetionsEntity({
    required this.id,
    required this.query,
    required this.count,
    required this.type,
    required this.typeString,
  });

  final int? id;
  final String? query;
  final int? count;
  final String? type;
  final String? typeString;


}
