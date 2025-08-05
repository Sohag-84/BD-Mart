import 'package:gym_swat/core/entity/response_entity.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/auth/domain/repository/auth_repository.dart';

class ForgetPasswordConfirmUsecase
    implements Usecase<ResponseEntity, ForgetPassConfirmParams> {
  final AuthRepository authRepository;
  const ForgetPasswordConfirmUsecase({required this.authRepository});

  @override
  ResultFuture<ResponseEntity> call(ForgetPassConfirmParams params) async {
    return await authRepository.forgetPasswordConfirm(
      verificationCode: params.verificationCode,
      newPassword: params.newPassword,
    );
  }
}

class ForgetPassConfirmParams {
  final String verificationCode;
  final String newPassword;
  const ForgetPassConfirmParams({
    required this.verificationCode,
    required this.newPassword,
  });
}
