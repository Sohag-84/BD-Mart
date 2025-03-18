import 'package:gym_swat/core/constants/exports.dart';

Widget customButton({
  required VoidCallback onTap,
  required String btnText,
  double height = 40,
  double fontSize = 13,
  Color color = AppColors.primaryColor,
  Color fontColor = AppColors.blackColor,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: fontSize.sp,
          color: fontColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
