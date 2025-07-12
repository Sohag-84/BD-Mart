import 'package:gym_swat/core/config/app_config.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/widgets/custom_product_container.dart';
import 'package:gym_swat/features/product/presentation/bloc/product_bloc.dart';

import 'product_details_view.dart';

class ProductView extends StatefulWidget {
  // final String title;
  // final String url;
  const ProductView({
    super.key,
  });

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  late ProductBloc productBloc;

  @override
  void initState() {
    super.initState();
    productBloc = BlocProvider.of<ProductBloc>(context);
    productBloc.add(const ProductFetchedEvent(url: AppConfig.products));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Navigate to search screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading && productBloc.productList.isEmpty) {
              return loader();
            } else if (state is ProductLoadingFailed) {
              return Center(child: Text(state.message));
            } else if (state is ProductLoaded) {
              if (state.productList.isEmpty) {
                return dataNotFound();
              }

              return refresh(
                onRefresh: () async {
                  productBloc.add(
                    const ProductFetchedEvent(
                      url: AppConfig.products,
                      isRefresh: true,
                    ),
                  );
                },
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollInfo) {
                    if (scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent &&
                        !state.hasReachedMax) {
                      productBloc.add(
                        const ProductFetchedEvent(url: AppConfig.products),
                      );
                    }
                    return false;
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.h,
                            crossAxisSpacing: 15.w,
                            mainAxisExtent: 290.h,
                          ),
                          itemCount: state.productList.length,
                          itemBuilder: (context, index) {
                            final product = state.productList[index];
                            return customProductContainer(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ProductDetailsView(),
                                  ),
                                );
                              },
                              image: product.thumbnailImage!,
                              productName: product.name ?? "",
                              discount: "${product.discount}",
                              discountPrice: "200",
                              sellingPrice: product.mainPrice ?? "",
                            );
                          },
                        ),

                        //for paingation loader
                        Gap(5.h),
                        if (state.isPaginating && state.productList.isNotEmpty)
                          paginationLoader(),
                        Gap(5.h),
                      ],
                    ),
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
