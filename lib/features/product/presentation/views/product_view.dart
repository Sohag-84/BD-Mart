import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/core/widgets/custom_product_container.dart';
import 'package:gym_swat/features/product/presentation/bloc/product/product_bloc.dart';

class ProductView extends StatefulWidget {
  final String title;
  final String url;
  final bool isPagination;
  const ProductView({
    super.key,
    required this.title,
    required this.url,
    this.isPagination = true,
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
    productBloc.add(ProductFetchedEvent(url: widget.url, isRefresh: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                    ProductFetchedEvent(
                      url: widget.url,
                      isRefresh: true,
                    ),
                  );
                },
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollInfo) {
                    if (scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent &&
                        !state.hasReachedMax) {
                      if (widget.isPagination) {
                        productBloc.add(ProductFetchedEvent(url: widget.url));
                      }
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
                              discountPrice: "200",
                              sellingPrice: product.mainPrice ?? "",
                            );
                          },
                        ),

                        //for paingation loader
                        Gap(5.h),
                        if (state.isFetching && state.productList.isNotEmpty)
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
