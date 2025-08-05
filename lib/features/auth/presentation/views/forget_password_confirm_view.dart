import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/core/widgets/button.dart';
import 'package:gym_swat/core/widgets/custom_input_decoration.dart';
import 'package:gym_swat/features/auth/presentation/bloc/forget_password/forget_password_bloc.dart';
import 'package:gym_swat/features/auth/presentation/widgets/auth_ui.dart';

class ForgetPasswordConfirmView extends StatefulWidget {
  const ForgetPasswordConfirmView({super.key});

  @override
  State<ForgetPasswordConfirmView> createState() =>
      _ForgetPasswordConfirmViewState();
}

class _ForgetPasswordConfirmViewState extends State<ForgetPasswordConfirmView> {
  final verificationCodeController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    verificationCodeController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AuthScreen.buildScreen(
      context,
      "Forget Password!",
      buildBody(screenWidth, context),
      isBackButton: true,
    );
  }

  Widget buildBody(double screenWidth, BuildContext context) {
    return BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordConfirmLoading) {
          eassyLoading();
        } else {
          EasyLoading.dismiss();
        }

        if (state is ForgetPasswordConfirmFailure) {
          Fluttertoast.showToast(msg: state.error);
        } else if (state is ForgetPasswordConfirm) {
          Fluttertoast.showToast(msg: state.responseResult.message ?? "");
          if (state.responseResult.result!) {
            context.pushNamed(AppRoutes.login.name);
          }
        }
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: boxShadow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width: screenWidth * (3 / 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///verification code
                    const Padding(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        verificationCode,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 36,
                            child: TextField(
                              controller: verificationCodeController,
                              autofocus: false,
                              decoration:
                                  InputDecorations.buildInputDecoration_1(
                                hintText: verificationCodeHint,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///otp code
                    const Padding(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        newPassword,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 36,
                            child: TextField(
                              controller: passwordController,
                              autofocus: false,
                              decoration:
                                  InputDecorations.buildInputDecoration_1(
                                hintText: newPasswordHint,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: SizedBox(
                        height: 45,
                        child: Button.basic(
                          minWidth: MediaQuery.of(context).size.width,
                          color: AppColors.primaryColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6.0),
                            ),
                          ),
                          child: const Text(
                            submit,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () async {
                            if (verificationCodeController.text
                                .trim()
                                .isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Verification code can't be empty");
                              return;
                            }
                            if (passwordController.text.trim().isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "New password can't be empty");
                              return;
                            }
                            context.read<ForgetPasswordBloc>().add(
                                  ForgetPasswordConfirmEvent(
                                    verificationCode:
                                        verificationCodeController.text,
                                    newPassword: passwordController.text,
                                  ),
                                );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
