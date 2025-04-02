import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/features/product/data/models/product_model.dart';

abstract interface class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts({
    required String url,
    required int page,
  });
}
