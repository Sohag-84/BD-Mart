import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/core/widgets/button.dart';
import 'package:gym_swat/core/widgets/custom_input_decoration.dart';
import 'package:gym_swat/features/auth/presentation/cubit/password_visibility_cubit.dart';
import 'package:gym_swat/features/auth/presentation/widgets/auth_ui.dart';

class LoginView extends StatefulWidget {
  final bool backButton;
  const LoginView({super.key, this.backButton = false});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AuthScreen.buildScreen(
      context,
      loginDecription,
      buildBody(context, screenWidth),
      backButton: widget.backButton,
    );
  }

  Widget buildBody(BuildContext context, double screenWidth) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: boxShadow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: screenWidth * (3 / 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///email field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            email,
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: SizedBox(
                            height: 46,
                            child: TextField(
                              controller: emailController,
                              autofocus: false,
                              decoration:
                                  InputDecorations.buildInputDecoration_1(
                                hintText: emailHintText,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    ///password field
                    const Padding(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        password,
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    BlocBuilder<PasswordVisibilityCubit,
                        PasswordVisibilityState>(
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: SizedBox(
                            height: 46,
                            child: TextField(
                              controller: passwordController,
                              autofocus: false,
                              obscureText: state.loginPasswordObscure,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration:
                                  InputDecorations.buildInputDecoration_1(
                                hintText: passwordHintText,
                                isPasswordField: true,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    context
                                        .read<PasswordVisibilityCubit>()
                                        .toggleLoginPasswordVisibility();
                                  },
                                  icon: Icon(
                                    state.loginPasswordObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    ///login button
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.textFieldGrey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Button.minWidthFixHeight(
                          minWidth: MediaQuery.of(context).size.width,
                          height: 50,
                          color: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: const Text(
                            login,
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Gap(25.h),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return const ForgetPasswordWithEmailView();
                  //     },
                  //   ),
                  // );
                },
                child: const Text(
                  forgetPassword,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                  ),
                ),
              ),
              Text(
                dontHaveAnAccount,
                style: TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 12,
                ),
              ),
              InkWell(
                child: const Text(
                  signupNow,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  context.pushNamed(AppRoutes.signup.name);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
