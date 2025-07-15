import 'package:flutter/services.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/utils/custom_snackbar.dart';
import 'package:gym_swat/core/widgets/slider_image.dart';
import 'package:gym_swat/features/product/presentation/bloc/product_details/product_details_bloc.dart';
import 'package:gym_swat/features/product/presentation/bloc/related_product/related_product_bloc.dart';
import 'package:gym_swat/features/product/presentation/part/product_description_section.dart';
import 'package:gym_swat/features/product/presentation/part/product_info_container.dart';
import 'package:gym_swat/features/product/presentation/part/refund_section.dart';
import 'package:gym_swat/features/product/presentation/part/related_product_section.dart';

class ProductDetailsView extends StatefulWidget {
  final String productId;
  const ProductDetailsView({super.key, required this.productId});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  void initState() {
    super.initState();
    context
        .read<ProductDetailsBloc>()
        .add(ProductDetailsFetch(productId: widget.productId));

    context
        .read<RelatedProductBloc>()
        .add(RelatedProductFetch(productId: widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: refresh(
        onRefresh: () async {
          context
              .read<ProductDetailsBloc>()
              .add(ProductDetailsFetch(productId: widget.productId));

          context
              .read<RelatedProductBloc>()
              .add(RelatedProductFetch(productId: widget.productId));
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
                builder: (context, state) {
                  if (state is ProductDetailsLoading) {
                    return SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      child: loader(),
                    );
                  } else if (state is ProductDetailsFailure) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else if (state is ProductDetailsLoaded) {
                    if (state.productDetails.isEmpty) {
                      return dataNotFound();
                    }
                    final product = state.productDetails[0];
                    return Column(
                      children: [
                        //image section
                        homeSlider(
                          height: 270.h,
                          imageList: product.photos.map((photo) {
                            return photo.path ?? defaultLogo;
                          }).toList(),
                          boxFit: BoxFit.contain,
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              productInfoContainer(
                                context: context,
                                product: product,
                              ),
                              Gap(15.h),

                              /// coupon code
                              product.couponCode == null
                                  ? const SizedBox()
                                  : GestureDetector(
                                      onTap: () {
                                        Clipboard.setData(
                                          ClipboardData(
                                            text: product.couponCode ?? "",
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
                                              "Coupon Code: ${product.couponCode}",
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                color: AppColors.greenColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.copy,
                                            color: AppColors.greenColor,
                                            size: 18.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                              Gap(15.h),
                              RefundSection(onViewPolicyTap: () {}),
                              Gap(15.h),

                              //product description
                              ProductDetailsDescriptionSection(
                                description1StPart:
                                    product.description1StPart ?? "",
                                description: product.description ?? "",
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),

              //related product section
              relatedProductSection(),
            ],
          ),
        ),
      ),
    );
  }
}
