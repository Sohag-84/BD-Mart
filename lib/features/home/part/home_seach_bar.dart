import 'package:gym_swat/core/constants/exports.dart';

Widget homeSearchBar({required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 40.h,
      width: 280.w,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(left: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 150.w,
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.darkCharcoal,
                overflow: TextOverflow.ellipsis,
              ),
              child: const Text(search),
            ),
          ),
          Container(
            height: 40.h,
            width: 33.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
              color: AppColors.primaryColor,
            ),
            child: const Icon(
              Icons.search,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    ),
  );
}
