import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/features/product/data/models/product_model.dart';
import 'package:gym_swat/features/product/domain/repositories/product_repository.dart';

class GetProductUsecase implements Usecase<List<Product>, NoParams> {
  final ProductRepository productRepository;
  const GetProductUsecase({required this.productRepository});

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return await productRepository.getProducts();
  }
}
