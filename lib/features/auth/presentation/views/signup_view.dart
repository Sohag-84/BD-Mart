import 'package:flutter/gestures.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/core/widgets/button.dart';
import 'package:gym_swat/core/widgets/custom_input_decoration.dart';
import 'package:gym_swat/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:gym_swat/features/auth/presentation/cubit/password_visibility_cubit.dart';
import 'package:gym_swat/features/auth/presentation/widgets/auth_ui.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool? isAgree = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AuthScreen.buildScreen(
      context,
      signupDescription,
      isBackButton: true,
      buildBody(
        context,
        screenWidth,
      ),
    );
  }

  Widget buildBody(BuildContext context, double screenWidth) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          eassyLoading();
        } else {
          EasyLoading.dismiss();
        }
        if (state is RegisterFailure) {
          Fluttertoast.showToast(msg: state.error);
        } else if (state is RegisterSuccess) {
          Fluttertoast.showToast(msg: state.message);
          context.pushNamed(AppRoutes.otpVerification.name, extra: {
            "emailOrPhone": state.emailOrPhone,
            "userId": state.userId,
          });
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: boxShadow,
              ),
              child: SizedBox(
                width: screenWidth * (3 / 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///name
                    const Text(
                      name,
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(4.h),
                    SizedBox(
                      height: 46,
                      child: TextField(
                        controller: nameController,
                        autofocus: false,
                        decoration: InputDecorations.buildInputDecoration_1(
                          hintText: nameHintText,
                        ),
                      ),
                    ),
                    Gap(8.h),

                    /// email
                    const Text(
                      email,
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(4.h),
                    SizedBox(
                      height: 46,
                      child: TextField(
                        controller: emailController,
                        autofocus: false,
                        decoration: InputDecorations.buildInputDecoration_1(
                          hintText: emailHintText,
                        ),
                      ),
                    ),
                    Gap(8.h),

                    ///passwrod textfield
                    const Text(
                      password,
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(4.h),
                    BlocBuilder<PasswordVisibilityCubit,
                        PasswordVisibilityState>(
                      builder: (context, state) {
                        return SizedBox(
                          height: 46,
                          child: TextField(
                            controller: passwordController,
                            autofocus: false,
                            obscureText: state.signupPasswordObscure,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecorations.buildInputDecoration_1(
                              hintText: passwordHintText,
                              isPasswordField: true,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  context
                                      .read<PasswordVisibilityCubit>()
                                      .toggleSignupPasswordVisibility();
                                },
                                icon: Icon(
                                  state.signupPasswordObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Gap(8.h),

                    ///retype password
                    const Text(
                      retypePassword,
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(4.h),
                    BlocBuilder<PasswordVisibilityCubit,
                        PasswordVisibilityState>(
                      builder: (context, state) {
                        return SizedBox(
                          height: 46,
                          child: TextField(
                            controller: confirmPasswordController,
                            autofocus: false,
                            obscureText: state.confirmPasswordObscure,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecorations.buildInputDecoration_1(
                              hintText: passwordHintText,
                              isPasswordField: true,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  context
                                      .read<PasswordVisibilityCubit>()
                                      .toggleConfirmPasswordVisibility();
                                },
                                icon: Icon(
                                  state.confirmPasswordObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Gap(25.h),

                    ///agree button
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                          width: 15,
                          child: Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            value: isAgree,
                            onChanged: (newValue) {
                              isAgree = newValue;
                              setState(() {});
                            },
                            activeColor: AppColors.primaryColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width - 130,
                            child: RichText(
                              maxLines: 2,
                              text: TextSpan(
                                style: const TextStyle(
                                  color: AppColors.darkGrey,
                                  fontSize: 12,
                                ),
                                children: [
                                  const TextSpan(
                                    text: "I agree to the",
                                  ),
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.pushNamed(
                                            AppRoutes.privaceyPolicy.name);
                                      },
                                    style: const TextStyle(
                                      color: AppColors.primaryColor,
                                    ),
                                    text: termsConditions,
                                  ),
                                  const TextSpan(text: " $and "),
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.pushNamed(
                                            AppRoutes.termsAndConditions.name);
                                      },
                                    text: privacyPolicy,
                                    style: const TextStyle(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(25.h),

                    ///signup button
                    SizedBox(
                      height: 45,
                      child: Button.minWidthFixHeight(
                        minWidth: MediaQuery.of(context).size.width,
                        height: 50,
                        color: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: const Text(
                          signup,
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: isAgree!
                            ? () async {
                                context.read<AuthBloc>().add(
                                      RegisterUser(
                                        name: nameController.text,
                                        emailOrPhone: emailController.text,
                                        password: passwordController.text,
                                        confirmPassword:
                                            confirmPasswordController.text,
                                        deviceToken: "",
                                      ),
                                    );
                              }
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(20.h),

            ///navigate to login page button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                    child: Text(
                  alreadyHaveAccount,
                  style: TextStyle(
                    color: AppColors.darkGrey,
                    fontSize: 12,
                  ),
                )),
                const SizedBox(width: 10),
                InkWell(
                  child: const Text(
                    login,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
