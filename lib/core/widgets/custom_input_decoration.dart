import 'package:gym_swat/core/constants/exports.dart';

class InputDecorations {
  static InputDecoration buildInputDecoration_1({
    hintText = "",
    bool isPasswordField = false,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: AppColors.whiteColor,
      suffixIcon: isPasswordField ? suffixIcon : null,
      hintStyle: const TextStyle(
        fontSize: 12.0,
        color: AppColors.textFieldGrey,
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.darkGrey,
          width: 0.2,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(6.0),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 0.5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(6.0),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    );
  }

  static InputDecoration buildInputDecoration_phone({hintText = ""}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        fontSize: 12.0,
        color: AppColors.textFieldGrey,
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.textFieldGrey,
          width: 0.5,
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(6.0),
          bottomRight: Radius.circular(6.0),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 0.5,
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(6.0),
          bottomRight: Radius.circular(6.0),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    );
  }
}
