import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/core/utils/circular_indicator.dart';
import 'package:gym_swat/features/category/widgets/custom_offer_container.dart';
import 'package:gym_swat/features/home/presentation/bloc/home_bloc.dart';
import 'package:gym_swat/features/product/presentation/views/product_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: customAppBar(
        title: allCategories,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeCategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeCategoryLoadingFailure) {
            return const Center(
              child: Text('Failed to load data'),
            );
          } else if (state is HomeCategoryLoaded) {
            return refresh(
              onRefresh: () async {
                context.read<HomeBloc>().add(
                      HomeCategoryFetchedEvent(),
                    );
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
                            onTap: () {},
                            image: icFlash,
                            offerName: flashSale,
                          ),

                          ///todays deal
                          customOfferContainer(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProductView(),
                                ),
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
                                    imagePath: category.banner.toString(),
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
