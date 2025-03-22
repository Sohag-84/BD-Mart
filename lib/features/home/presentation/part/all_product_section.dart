import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/widgets/custom_product_container.dart';
import 'package:gym_swat/features/product/views/product_details_view.dart';
import 'package:gym_swat/features/product/views/product_view.dart';

Widget allProductsSection({
  required BuildContext context,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            justForYou,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductView(),
                ),
              );
            },
            child: Text(
              shopMore,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
      Gap(5.h),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 15.w,
          mainAxisExtent: 290.h,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return customProductContainer(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductDetailsView(),
                ),
              );
            },
            image: "assets/images/bottle.png",
            productName:
                "Nitro Tech Protein Nitro Tech Protein Nitro Tech Protein Nitro Tech Protein",
            discount: "10 %",
            discountPrice: "78",
            sellingPrice: "300",
          );
        },
      ),
      Gap(10.h),
      Center(
        child: GestureDetector(
          onTap: () {},
          child: Text(
            shopMore,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    ],
  );
}
