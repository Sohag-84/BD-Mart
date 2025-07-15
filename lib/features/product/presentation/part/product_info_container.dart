import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/features/product/domain/entity/product_details_entity.dart';
import 'package:share_plus/share_plus.dart';

Widget productInfoContainer({
  required BuildContext context,
  required ProductDetailsEntity product,
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
            product.rating == 0
                ? const SizedBox()
                : ratingBar(
                    ratings: double.parse(
                      product.rating.toString(),
                    ),
                  ),
            Gap(5.w),
            product.rating == 0
                ? Container()
                : Text(
                    "(${product.ratingCount ?? "0"})",
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
                await Share.share(product.link ?? "https://martkit.com/");
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
          product.name ?? "",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        Gap(10.w),

        ///brands
        product.brand!.name.toString().isEmpty
            ? Container()
            : Text(
                "Brand: ${product.brand?.name ?? ""}",
                style: TextStyle(
                  color: AppColors.lightGreyColor,
                  fontSize: 13.sp,
                ),
              ),
        product.unit == null
            ? const SizedBox()
            : Text(
                "Unit: ${product.unit ?? ''}",
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
            product.discount == "-0%"
                ? const SizedBox()
                : Text.rich(
                    TextSpan(
                      text: takaSign,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.lightGreyColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                      children: [
                        TextSpan(
                          text: "${product.strokedPrice}",
                        ),
                      ],
                    ),
                  ),

            Gap(5.w),
            //price
            Text.rich(
              TextSpan(
                text: takaSign,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.greenColor,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: "${product.mainPrice}",
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

            product.discount == "-0%"
                ? const SizedBox()
                : Container(
                    padding: EdgeInsets.all(1.w),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Text(
                      "$takaSign${product.discount}",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.redColor,
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
