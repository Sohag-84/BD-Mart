import 'package:gym_swat/core/entity/response_entity.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/auth/domain/repository/auth_repository.dart';

class OtpSubmitUsecase implements Usecase<void, OtpSubmitParams> {
  final AuthRepository authRepository;
  const OtpSubmitUsecase({required this.authRepository});

  @override
  ResultFuture<ResponseEntity> call(OtpSubmitParams params) async {
    return await authRepository.otpSubmit(
      userId: params.userId,
      otpCode: params.otpCode,
    );
  }
}

class OtpSubmitParams {
  final String userId;
  final String otpCode;

  OtpSubmitParams({required this.userId, required this.otpCode});
}
