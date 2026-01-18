import 'dart:async';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/core/services/network_service.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/category/data/datasource/local/category_local_datasource.dart';
import 'package:gym_swat/features/category/data/datasource/remote/category_remote_datasource.dart';
import 'package:gym_swat/features/category/domain/entity/category_entity.dart';
import 'package:gym_swat/features/category/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDatasource categoryRemoteDatasource;
  final CategoryLocalDatasource categoryLocalDatasource;
  final ConnectionChecker connectionChecker;

  const CategoryRepositoryImpl({
    required this.categoryRemoteDatasource,
    required this.categoryLocalDatasource,
    required this.connectionChecker,
  });

  @override
  ResultFuture<List<CategoryEntity>> getCategories(
      {required String url}) async {
    try {
      final isConnected = await connectionChecker.isConnected;
      if (!isConnected) {
        final localCategory = await categoryLocalDatasource.getCategories();
        if (localCategory.isNotEmpty) {
          return right(localCategory);
        } else {
          return left(const NetworkFailure("No internet connection"));
        }
      }

      final result = await categoryRemoteDatasource.getCategories(url: url);

      //Prevent subcategory from saving locally
      if (!url.contains("sub-categorie")) {
        await categoryLocalDatasource.saveCategory(categories: result);
      }

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
