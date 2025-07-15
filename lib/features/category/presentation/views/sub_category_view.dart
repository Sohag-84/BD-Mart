import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/config/app_config.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/core/widgets/custom_product_container.dart';
import 'package:gym_swat/features/category/presentation/bloc/sub_category/sub_category_bloc.dart';
import 'package:gym_swat/features/category/presentation/part/sub_category_animated_row_section.dart';
import 'package:gym_swat/features/product/presentation/bloc/product/product_bloc.dart';

class SubCategoryView extends StatefulWidget {
  final String categoryName;
  final String productUrl;
  final String categoryId;
  const SubCategoryView({
    super.key,
    required this.categoryName,
    required this.productUrl,
    required this.categoryId,
  });

  @override
  State<SubCategoryView> createState() => _SubCategoryViewState();
}

class _SubCategoryViewState extends State<SubCategoryView> {
  late ProductBloc productBloc;
  @override
  void initState() {
    super.initState();
    productBloc = BlocProvider.of<ProductBloc>(context);
    productBloc.add(ProductFetchedEvent(url: widget.productUrl));
    context.read<SubCategoryBloc>().add(SubcategoryFetch(
        url: "${AppConfig.subCategories}${widget.categoryId}",
        forceToLoadData: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: widget.categoryName),
      body: BlocBuilder<ProductBloc, ProductState>(
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
            return refresh(
              onRefresh: () async {
                productBloc.add(
                  ProductFetchedEvent(
                    url: widget.productUrl,
                    isRefresh: true,
                  ),
                );
                context.read<SubCategoryBloc>().add(
                      SubcategoryFetch(
                        url: "${AppConfig.subCategories}${widget.categoryId}",
                        forceToLoadData: true,
                      ),
                    );
              },
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent &&
                      !state.hasReachedMax) {
                    productBloc.add(
                      ProductFetchedEvent(url: widget.productUrl),
                    );
                  }
                  return false;
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      //header
                      subcategoryRowSection(categoryId: widget.categoryId),
                      Gap(5.h),

                      //body
                      GridView.builder(
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
                              ;
                            },
                            image: product.thumbnailImage!,
                            productName: product.name ?? "",
                            discount: "${product.discount}",
                            sellingPrice: product.mainPrice ?? "",
                            imageHeight: 100,
                            nameFontSize: 8,
                          );
                        },
                      ),

                      //for pagination loader
                      Gap(5.h),
                      if (state.isFetching && state.productList.isNotEmpty)
                        paginationLoader(),
                      Gap(5.h),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
