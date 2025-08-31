import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/features/category/presentation/bloc/all_category/all_category_bloc.dart';
import 'package:gym_swat/features/category/presentation/widgets/custom_offer_container.dart';

class AllCategoryView extends StatefulWidget {
  final String title;
  final String endPoint;
  const AllCategoryView({
    super.key,
    this.endPoint = "",
    this.title = "",
  });

  @override
  State<AllCategoryView> createState() => _AllCategoryViewState();
}

class _AllCategoryViewState extends State<AllCategoryView> {
  @override
  void initState() {
    super.initState();

    context.read<AllCategoryBloc>().add(
          AllCategoryFetch(url: widget.endPoint),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: customAppBar(
        context: context,
        title: allCategories,
      ),
      body: BlocBuilder<AllCategoryBloc, AllCategoryState>(
        builder: (context, state) {
          if (state is AllCategoryLoading) {
            return Center(child: loader());
          } else if (state is AllCategoryFailure) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is AllCategoryLoaded) {
            return refresh(
              onRefresh: () async {
                context
                    .read<AllCategoryBloc>()
                    .add(AllCategoryFetch(url: widget.endPoint));
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
                            onTap: () {},
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
