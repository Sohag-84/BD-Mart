import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/utils/custom_snackbar.dart';
import 'package:gym_swat/core/widgets/slider_image.dart';
import 'package:gym_swat/features/product/presentation/part/product_description_section.dart';
import 'package:gym_swat/features/product/presentation/part/product_info_container.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  final List<String> imageList = ["assets/images/slider_1.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //image section
            homeSlider(
              height: 270.h,
              imageList: imageList,
              boxFit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productInfoContainer(context: context),
                  Gap(15.h),

                  /// coupon code
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                        const ClipboardData(
                          text: "SR-50",
                        ),
                      );
                      showCustomSnackbar(
                        context: context,
                        title: "Coupon Code",
                        message: "Copied to clipboard!",
                      );
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Coupon Code: SR-50",
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.copy,
                          color: AppColors.primaryColor,
                          size: 18.sp,
                        ),
                      ],
                    ),
                  ),
                  Gap(15.h),

                  //product description
                  const ProductDetailsDescriptionSection(
                    description1StPart: description1stPart,
                    description: description2ndPart,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
