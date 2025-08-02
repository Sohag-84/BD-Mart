import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/auth/domain/repository/auth_repository.dart';

class OtpResendUsecase implements Usecase<void, OtpResendParams> {
  final AuthRepository authRepository;
  const OtpResendUsecase({required this.authRepository});

  @override
  ResultFuture<String> call(OtpResendParams params) async {
    return await authRepository.otpResend(
      userId: params.userId,
      registerBy: params.registerBy,
    );
  }
}

class OtpResendParams {
  final String userId;
  final String registerBy;

  OtpResendParams({required this.userId, required this.registerBy});
}
