import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/config/app_config.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/core/widgets/custom_product_container.dart';
import 'package:gym_swat/features/product/presentation/bloc/product/product_bloc.dart';
import 'package:gym_swat/features/product/presentation/views/product_view.dart';

Widget allProductsSection({
  required BuildContext context,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            forYou,
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
                  builder: (context) => const ProductView(
                    title: "Products",
                    url: AppConfig.products,
                  ),
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
      BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return loader();
          } else if (state is ProductLoadingFailed) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is ProductLoaded) {
            return Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 15.w,
                    mainAxisExtent: 290.h,
                  ),
                  itemCount: state.productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = state.productList[index];
                    return customProductContainer(
                      onTap: () {
                        context.pushNamed(
                          AppRoutes.productDetails.name,
                          extra: {
                            "productId": product.id.toString(),
                          },
                        );
                      },
                      image: product.thumbnailImage ?? defaultLogo,
                      productName: product.name ?? "",
                      discount: "${product.discount}",
                      discountPrice: null,
                      sellingPrice: product.mainPrice ?? "",
                    );
                  },
                ),
                Gap(5.h),
                if (state.isFetching && state.productList.isNotEmpty)
                  paginationLoader(),
                Gap(5.h),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    ],
  );
}
