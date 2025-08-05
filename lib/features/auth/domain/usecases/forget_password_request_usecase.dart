import 'package:gym_swat/core/entity/response_entity.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/auth/domain/repository/auth_repository.dart';

class ForgetPasswordRequestUsecase
    implements Usecase<ResponseEntity, ForgetPassReqParams> {
  final AuthRepository authRepository;
  const ForgetPasswordRequestUsecase({required this.authRepository});

  @override
  ResultFuture<ResponseEntity> call(ForgetPassReqParams params) async {
    return await authRepository.forgetPasswordRequest(
      emailOrPhone: params.emailOrPhone,
      sendCodeBy: params.sendCodeBy,
    );
  }
}

class ForgetPassReqParams {
  final String emailOrPhone;
  final String sendCodeBy;

  const ForgetPassReqParams({
    required this.emailOrPhone,
    required this.sendCodeBy,
  });
}
