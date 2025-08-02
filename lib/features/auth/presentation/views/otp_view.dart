import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/core/utils/local_preferences.dart';
import 'package:gym_swat/core/widgets/custom_button.dart';
import 'package:gym_swat/features/auth/presentation/bloc/otp/otp_bloc.dart';
import 'package:pinput/pinput.dart';

class OtpView extends StatefulWidget {
  final String emailOrPhone;
  final String userId;
  const OtpView({
    super.key,
    required this.emailOrPhone,
    required this.userId,
  });

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<OtpBloc, OtpState>(
        listener: (context, state) {
          if (state is OtpSubmitLoading || state is OtpResendLoading) {
            eassyLoading();
          } else {
            EasyLoading.dismiss();
          }
          if (state is OtpSubmitFailure) {
            Fluttertoast.showToast(msg: state.error);
          } else if (state is OtpSubmitSuccess) {
            Fluttertoast.showToast(msg: state.message);
            context.pushNamed(AppRoutes.login.name);
          } else if (state is OtpResendFailure) {
            Fluttertoast.showToast(msg: state.error);
          } else if (state is OtpResendSuccess) {
            Fluttertoast.showToast(msg: state.message);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    "OTP Verification",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "We sent your code to ${widget.emailOrPhone}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Color(0xFF757575)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                  ///otp textfield
                  Pinput(
                    length: 6,
                    controller: otpController,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  ),
                  const SizedBox(height: 24),

                  ///otp submit button
                  customButton(
                    onTap: () {
                      int userId = LocalPreferenceService.instance.getUserId();
                      context.read<OtpBloc>().add(
                            OtpSubmit(
                              userId: userId.toString(),
                              otpCode: otpController.text,
                            ),
                          );
                    },
                    btnText: "Continue",
                    fontColor: AppColors.whiteColor,
                    height: 45,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),

                  ///otp resend button
                  TextButton(
                    onPressed: () async {
                      int userId = LocalPreferenceService.instance.getUserId();
                      context.read<OtpBloc>().add(
                            OtpResend(
                              userId: userId.toString(),
                              registerBy: "",
                            ),
                          );
                    },
                    child: const Text(
                      "Resend OTP Code",
                      style: TextStyle(color: Color(0xFF757575)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
