import 'dart:async';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/core/services/network_service.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/product/data/datasources/local_datasource/product_local_data_source.dart';
import 'package:gym_swat/features/product/data/datasources/remote_datasource/product_remote_data_source.dart';
import 'package:gym_swat/features/product/domain/entity/product_details_entity.dart';
import 'package:gym_swat/features/product/domain/entity/product_entity.dart';
import 'package:gym_swat/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;
  final ProductLocalDataSource productLocalDataSource;
  final ConnectionChecker connectionChecker;

  const ProductRepositoryImpl({
    required this.productRemoteDataSource,
    required this.productLocalDataSource,
    required this.connectionChecker,
  });

  @override
  ResultFuture<List<ProductEntity>> getProducts({
    required String url,
    required int page,
    bool isRefresh = false,
  }) async {
    try {
      final isConnected = await connectionChecker.isConnected;

      ///OFFLINE → show local only
      if (!isConnected) {
        final localProducts = await productLocalDataSource.getProducts();
        if (localProducts.isNotEmpty) {
          return right(localProducts);
        } else {
          return left(const NetworkFailure("No internet connection"));
        }
      }

      /// ONLINE + REFRESH or FIRST PAGE
      if (isRefresh || page == 1) {
        await productLocalDataSource.clearProducts();
      }

      /// Fetch from API
      final remoteProducts = await productRemoteDataSource.getProducts(
        url: url,
        page: page,
      );

      /// Save to local
      await productLocalDataSource.saveProducts(products: remoteProducts);

      return right(remoteProducts);
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

  @override
  ResultFuture<List<ProductEntity>> getRelatedProducts(
      {required String productId}) async {
    try {
      final result = await productRemoteDataSource.getRelatedProducts(
          productId: productId);
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
