import 'package:gym_swat/core/constants/exports.dart';
import 'package:share_plus/share_plus.dart';

Widget productInfoContainer({
  required BuildContext context,
}) {
  return Container(
    padding: EdgeInsets.all(5.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.r),
      color: Colors.grey.withValues(alpha: 0.1),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///ratings || favorite || share
        Row(
          children: [
            //ratings
            ratingBar(
              ratings: 4.5,
            ),
            Gap(5.w),
            Text(
              "(10)",
              style: TextStyle(
                color: AppColors.lightGreyColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),

            //favorite
            const Icon(
              Icons.favorite,
              color: Colors.black,
              size: 17,
            ),
            Gap(15.w),

            //share icon
            InkWell(
              onTap: () async {
                await Share.share("https://martkit.com/");
              },
              child: Icon(
                Icons.share_outlined,
                size: 17.w,
              ),
            ),
          ],
        ),
        Gap(10.h),
        //name
        Text(
          "Double Sided Magnetic Window Glass Cleaner Magnets Brush  (5-12mm/15-24mm/20-30mm) Home Wizard Wiper Surface Cleaning Tools",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        Gap(10.w),

        ///category and brand
        Text(
          "Category: Kids and Toys",
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.lightGreyColor,
          ),
        ),
        Gap(2.w),

        ///brands
        Text(
          "Brand: SR Mart",
          style: TextStyle(
            color: AppColors.lightGreyColor,
            fontSize: 13.sp,
          ),
        ),
        Text(
          'kg',
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
            color: Colors.deepPurple,
          ),
        ),
        Gap(10.h),

        ///price & discount
        Row(
          children: [
            //price
            Text.rich(
              TextSpan(
                text: takaSign,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.greenColor,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: "1245",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.greenColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            Gap(5.w),
            Text.rich(
              TextSpan(
                text: takaSign,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.lightGreyColor,
                  decoration: TextDecoration.lineThrough,
                ),
                children: const [
                  TextSpan(
                    text: "20",
                  ),
                ],
              ),
            ),

            Gap(5.w),
            Container(
              padding: EdgeInsets.all(1.w),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Text(
                "Save 200",
                style: TextStyle(
                  fontSize: 15.sp,
                  color: AppColors.lightGreyColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
