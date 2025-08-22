import 'dart:async';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/product/domain/entity/product_entity.dart';
import 'package:gym_swat/features/search/data/datasource/search_remote_datasource.dart';
import 'package:gym_swat/features/search/domain/entity/search_suggetions_entity.dart';
import 'package:gym_swat/features/search/domain/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDatasource searchRemoteDatasource;

  const SearchRepositoryImpl({required this.searchRemoteDatasource});

  @override
  ResultFuture<List<ProductEntity>> getSearchProduct({
    required String searchQuery,
    required int page,
  }) async {
    try {
      final result = await searchRemoteDatasource.getSearchProduct(
        searchQuery: searchQuery,
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
  ResultFuture<List<SearchSuggetionsEntity>> getSearchSuggestions({
    required String searchQuery,
  }) async {
    try {
      final result = await searchRemoteDatasource.getSearchSuggestions(
        searchQuery: searchQuery,
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
}
