import 'dart:async';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/core/services/network_service.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/home/data/datasources/local_datasources/slider_local_datasource.dart';
import 'package:gym_swat/features/home/data/datasources/remote_datasources/home_remote_data_source.dart';
import 'package:gym_swat/features/home/domain/entity/slider_entity.dart';
import 'package:gym_swat/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final SliderLocalDatasource localDatasource;
  final ConnectionChecker connectionChecker;

  const HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDatasource,
    required this.connectionChecker,
  });

  @override
  ResultFuture<List<SliderEntity>> getSliders() async {
    try {
      final isConnected = await connectionChecker.isConnected;
      if (!isConnected) {
        final localDb = await localDatasource.getSliders();
        if (localDb.isNotEmpty) {
          return right(localDb);
        } else {
          return left(const NetworkFailure("No internet connection"));
        }
      } else {
        final result = await remoteDataSource.getSliders();
        await localDatasource.saveSliders(sliders: result);
        return right(result);
      }
    } on SocketException {
      return left(const NetworkFailure("No internet connection"));
    } on TimeoutException {
      return left(const NetworkFailure("Request timed out"));
    } catch (e) {
      return left(ServerFailure("Server error: $e"));
    }
  }
}
