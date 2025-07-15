import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/core/widgets/custom_product_container.dart';
import 'package:gym_swat/features/product/presentation/bloc/product/product_bloc.dart';

Widget categoryProductsSection({required BuildContext context}) {
  final productBloc = BlocProvider.of<ProductBloc>(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading && productBloc.productList.isEmpty) {
            return loader();
          }
          if (state is ProductLoadingFailed) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is ProductLoaded) {
            if (state.productList.isEmpty) {
              return dataNotFound();
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
                mainAxisExtent: 210.h,
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
                  image: product.thumbnailImage!,
                  productName: product.name ?? "",
                  discount: "${product.discount}",
                  sellingPrice: product.mainPrice ?? "",
                  imageHeight: 100,
                  nameFontSize: 8,
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    ],
  );
}
