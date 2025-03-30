import 'dart:async';

import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/features/product/presentation/views/product_view.dart';

Widget subcategoryRowSection() {
  final ScrollController scrollController = ScrollController();
  bool isAutoScrolling = true;
  Timer? autoScrollTimer;

  void startAutoScroll() {
    autoScrollTimer?.cancel();
    const duration = Duration(milliseconds: 100);
    autoScrollTimer = Timer.periodic(duration, (_) {
      if (scrollController.hasClients && isAutoScrolling) {
        double maxScroll = scrollController.position.maxScrollExtent;
        double currentScroll = scrollController.offset;
        double scrollStep = 0.5;

        if (currentScroll >= maxScroll) {
          scrollController.jumpTo(0);
        } else {
          scrollController.jumpTo(currentScroll + scrollStep);
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

  WidgetsBinding.instance.addPostFrameCallback((_) => startAutoScroll());

  return Container(
    width: double.infinity,
    color: AppColors.darkCharcoal,
    child: Row(
      children: [
        Expanded(
          child: GestureDetector(
            onPanDown: (_) => stopAutoScroll(),
            onPanCancel: resumeAutoScroll,
            child: SizedBox(
              height: 60.h,
              child: ListView.builder(
                controller: scrollController,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 7.h, right: 8.w, bottom: 7.h),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductView(),
                          ),
                        );
                      },
                      child: Container(
                        width: 110.w,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        margin: EdgeInsets.all(2.w),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            customImage(
                              imagePath: "assets/images/bottle.png",
                              height: 30.h,
                            ),
                            Gap(5.h),
                            Expanded(
                              child: Text(
                                "Pre Workout proten proten",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.darkGreen,
                                  fontSize: 9.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Container(
          height: 66.h,
          width: 40.w,
          decoration: const BoxDecoration(
            color: AppColors.darkCharcoal,
          ),
          child: InkWell(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.dashboard_outlined,
                  color: AppColors.secondaryColor,
                ),
                Gap(5.h),
                Text(
                  seeAll,
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
