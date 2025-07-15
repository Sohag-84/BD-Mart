import 'package:gym_swat/features/category/data/model/category_model.dart';

abstract interface class CategoryRemoteDatasource {
  Future<List<CategoryModel>> getCategories({required String url});
}
