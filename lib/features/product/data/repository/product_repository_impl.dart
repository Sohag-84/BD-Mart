import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/features/product/data/datasources/product_remote_data_source.dart';
import 'package:gym_swat/features/product/data/models/product_model.dart';
import 'package:gym_swat/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;
  const ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  Future<Either<Failure, List<Product>>> getProducts({
    required String url,
    required int page,
  }) async {
    final result = await productRemoteDataSource.getProducts(
      url: url,
      page: page,
    );
    return right(result);
  }
}
