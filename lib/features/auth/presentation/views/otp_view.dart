import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/widgets/custom_button.dart';
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
      body: SingleChildScrollView(
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
                onTap: () {},
                btnText: "Continue",
                fontColor: AppColors.whiteColor,
                height: 45,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),

              ///otp resend button
              TextButton(
                onPressed: () async {},
                child: const Text(
                  "Resend OTP Code",
                  style: TextStyle(color: Color(0xFF757575)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
