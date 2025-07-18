import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/config/app_config.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/features/category/presentation/bloc/category/category_bloc.dart';
import 'package:gym_swat/features/category/presentation/widgets/custom_offer_container.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final String url = AppConfig.category;
  @override
  void initState() {
    super.initState();
    // Fetch only if not already loaded
    final bloc = context.read<CategoryBloc>();
    if (bloc.state is! CategoryLoaded) {
      bloc.add(CategoryFetch(url: url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: customAppBar(
        title: allCategories,
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return Center(child: loader());
          } else if (state is CategoryFailure) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is CategoryLoaded) {
            return refresh(
              onRefresh: () async {
                context
                    .read<CategoryBloc>()
                    .add(CategoryFetch(url: url, forceToLoadData: true));
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    //todays deal, brands, flash sale
                    Container(
                      height: 90,
                      width: double.infinity,
                      color: AppColors.darkCharcoal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ///flash sale
                          customOfferContainer(
                            onTap: () {
                              context.pushNamed(
                                AppRoutes.product.name,
                                extra: {
                                  "title": flashSale,
                                  "url": AppConfig.flashDeals,
                                  "isPagination": false,
                                },
                              );
                            },
                            image: icFlash,
                            offerName: flashSale,
                          ),

                          ///todays deal
                          customOfferContainer(
                            onTap: () {
                              context.pushNamed(
                                AppRoutes.product.name,
                                extra: {
                                  "title": todaysDeal,
                                  "url": AppConfig.todaysDeal,
                                  "isPagination": false,
                                },
                              );
                            },
                            image: icToadyDeals,
                            offerName: todaysDeal,
                          ),

                          ///package
                          customOfferContainer(
                            onTap: () {},
                            image: icPackage,
                            offerName: package,
                          ),

                          ///blogs
                          customOfferContainer(
                            onTap: () {},
                            image: icBlog,
                            offerName: blogs,
                          ),
                        ],
                      ),
                    ),

                    Gap(5.h),
                    Padding(
                      padding: EdgeInsets.all(12.w),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 125.h,
                        ),
                        itemCount: state.categoryList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final category = state.categoryList[index];
                          return GestureDetector(
                            onTap: () {
                              context.pushNamed(
                                AppRoutes.subCategory.name,
                                extra: {
                                  "categoryName": category.name,
                                  "productUrl": category.links.products,
                                  "categoryId": category.id.toString(),
                                },
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(5.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r),
                                boxShadow: boxShadow,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  customImage(
                                    imagePath: category.banner ?? defaultLogo,
                                    height: 70.h,
                                  ),
                                  Gap(5.h),
                                  Text(
                                    category.name ?? "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
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
