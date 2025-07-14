import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/widgets/custom_button.dart';

Widget customProductContainer({
  required VoidCallback onTap,
  required String image,
  required String productName,
  String? discount,
  String? discountPrice,
  double nameFontSize = 12,
  double imageHeight = 190,
  required String sellingPrice,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 150.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 2,
            offset: const Offset(0.0, 0.10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///image & name
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///product image & discount
              Stack(
                children: [
                  customImage(
                    imagePath: image,
                    height: imageHeight.h,
                    width: double.infinity,
                  ),

                  ///discount
                  discount != null && discount != "-0%"
                      ? Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 3.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.redColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8.r),
                                bottomRight: Radius.circular(
                                  8.r,
                                ),
                              ),
                            ),
                            child: Text(
                              discount,
                              style: TextStyle(
                                fontSize: nameFontSize.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              Gap(5.h),

              ///name
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.0.w,
                ),
                child: Text(
                  productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ],
          ),
          Gap(2.h),

          ///discount & selling price
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.0.w,
            ).copyWith(bottom: 5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///price
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: takaSign,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: " $sellingPrice",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(5.w),
                    discountPrice != null
                        ? Text(
                            "Save $takaSign $discountPrice",
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.solidGreen,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
                Gap(5.h),
                customButton(
                  height: 28,
                  onTap: () {},
                  btnText: orderNow,
                  fontSize: 10,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
