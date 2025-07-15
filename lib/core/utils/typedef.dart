import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
