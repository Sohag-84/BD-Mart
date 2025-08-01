import 'package:gym_swat/core/constants/exports.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Otp"),
      ),
    );
  }
}
