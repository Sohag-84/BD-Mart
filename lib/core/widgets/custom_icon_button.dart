import 'package:gym_swat/core/constants/exports.dart';

Widget customIconButton({
  required VoidCallback onTap,
  String? image,
  IconData? icon,
  double imageHeight = 25,
  double imageWidth = 25,
  Color bgColor = Colors.white,
  double opacity = 0.90,
  double padding = 8.0,
  Color iconColor = Colors.black,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(padding.w),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(opacity),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 2,
            offset: const Offset(0.1, 0.10),
          ),
        ],
      ),
      child: image != null
          ? customImage(
              imagePath: image,
              height: imageHeight.h,
              width: imageWidth.w,
            )
          : Icon(icon,color: iconColor),
    ),
  );
}
