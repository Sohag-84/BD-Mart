import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}
