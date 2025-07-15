import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/core/widgets/custom_product_container.dart';
import 'package:gym_swat/features/product/presentation/bloc/related_product/related_product_bloc.dart';

Widget relatedProductSection() {
  return BlocBuilder<RelatedProductBloc, RelatedProductState>(
    builder: (context, state) {
      if (state is RelatedProductLoading) {
        return loader();
      } else if (state is RelatedProductFailure) {
        return Center(
          child: Text(state.error),
        );
      } else if (state is RelatedProductLoaded) {
        if (state.productList.isEmpty) {
          return const SizedBox();
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                relatedProduct,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(5.h),
              SizedBox(
                height: 250.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: state.productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = state.productList[index];

                    return Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: customProductContainer(
                        onTap: () {
                          context.pushNamed(
                            AppRoutes.productDetails.name,
                            extra: {"productId": product.id.toString()},
                          );
                        },
                        image: product.thumbnailImage ?? defaultLogo,
                        productName: product.name ?? "",
                        sellingPrice: product.mainPrice ?? "",
                        discount: product.discount ?? "",
                        imageHeight: 150,
                      ),
                    );
                  },
                ),
              ),
              Gap(5.h),
            ],
          );
        }
      } else {
        return const SizedBox();
      }
    },
  );
}
