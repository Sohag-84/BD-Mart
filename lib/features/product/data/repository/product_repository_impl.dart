import 'dart:async';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/product/data/datasources/product_remote_data_source.dart';
import 'package:gym_swat/features/product/data/models/product_model.dart';
import 'package:gym_swat/features/product/domain/entity/product_details_entity.dart';
import 'package:gym_swat/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;
  const ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  ResultFuture<List<Product>> getProducts({
    required String url,
    required int page,
  }) async {
    try {
      final result = await productRemoteDataSource.getProducts(
        url: url,
        page: page,
      );
      return right(result);
    } on SocketException {
      return left(const NetworkFailure("No internet connection"));
    } on TimeoutException {
      return left(const NetworkFailure("Request timed out"));
    } catch (e) {
      return left(ServerFailure("Server error: $e"));
    }
  }

  @override
  ResultFuture<List<ProductDetailsEntity>> getProductDetails({
    required String productId,
  }) async {
    try {
      final result =
          await productRemoteDataSource.getProductDetails(productId: productId);
      return right(result);
    } on SocketException {
      return left(const NetworkFailure("No internet connection"));
    } on TimeoutException {
      return left(const NetworkFailure("Request timed out"));
    } catch (e) {
      return left(ServerFailure("Server error: $e"));
    }
  }
}
