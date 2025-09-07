import 'dart:async';
import 'package:gym_swat/core/config/app_config.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/features/category/presentation/bloc/feature_category/feature_category_bloc.dart';
import 'package:gym_swat/features/category/presentation/views/all_category_view.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  final ScrollController _scrollController = ScrollController();
  bool isAutoScrolling = true;
  Timer? autoScrollTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => startAutoScroll());
  }

  void startAutoScroll() {
    autoScrollTimer?.cancel();
    const duration = Duration(milliseconds: 50);
    autoScrollTimer = Timer.periodic(duration, (_) {
      if (_scrollController.hasClients && isAutoScrolling) {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double currentScroll = _scrollController.offset;
        double scrollStep = 0.5;

        if (currentScroll >= maxScroll) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.jumpTo(currentScroll + scrollStep);
        }
      }
    });
  }

  void stopAutoScroll() {
    autoScrollTimer?.cancel();
    isAutoScrolling = false;
  }

  void resumeAutoScroll() {
    isAutoScrolling = true;
    startAutoScroll();
  }

  @override
  void dispose() {
    autoScrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95.h,
      child: BlocBuilder<FeatureCategoryBloc, FeatureCategoryState>(
        buildWhen: (previous, current) =>
            current is FeatureCategoryLoaded ||
            current is FeatureCategoryLoading ||
            current is FeatureCategoryFailure,
        builder: (context, state) {
          if (state is FeatureCategoryLoading) {
            return loader();
          } else if (state is FeatureCategoryFailure) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is FeatureCategoryLoaded) {
            final categories = state.featureCategoryList;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      category,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllCategoryView(
                              endPoint: AppConfig.featureudCategory,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        seeAll,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                SizedBox(
                  height: 60,
                  child: GestureDetector(
                    onPanDown: (_) => stopAutoScroll(),
                    onPanEnd: (_) => resumeAutoScroll(),
                    child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final item = categories[index];
                        return GestureDetector(
                          onTap: () {
                            stopAutoScroll();
                            // Get.to(ProductView(...))?.then((_) => resumeAutoScroll());
                          },
                          child: Container(
                            width: 120.w,
                            padding: EdgeInsets.all(10.w),
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                customImage(
                                  imagePath: item.banner!,
                                  width: 35.w,
                                  height: 35.h,
                                ),
                                const Gap(5),
                                Expanded(
                                  child: Text(
                                    item.name ?? "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
