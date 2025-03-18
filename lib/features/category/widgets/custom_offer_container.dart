import 'package:gym_swat/core/constants/exports.dart';

Widget customOfferContainer({
  required VoidCallback onTap,
  required String image,
  required String offerName,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 75.w,
      height: 60.h,
      padding: EdgeInsets.symmetric(
        vertical: 0.h,
        horizontal: 0.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.secondaryColor,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 20,
              width: 20,
              child: Image.asset(image),
            ),
          ),
          Text(
            offerName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    ),
  );
}
