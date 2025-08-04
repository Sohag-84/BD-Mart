import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/widgets/button.dart';
import 'package:gym_swat/core/widgets/custom_input_decoration.dart';
import 'package:gym_swat/features/auth/presentation/widgets/auth_ui.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
    return Container(
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
            const Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: Text(
                email,
                style: TextStyle(
                  color: AppColors.primaryColor,
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
                  decoration: InputDecorations.buildInputDecoration_1(
                    hintText: emailHintText,
                  ),
                ),
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
                    sendCode,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () async {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
