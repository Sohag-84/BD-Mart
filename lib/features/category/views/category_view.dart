import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/features/category/widgets/custom_offer_container.dart';
import 'package:gym_swat/features/product/views/product_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: customAppBar(
        title: allCategories,
      ),
      body: SingleChildScrollView(
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
                itemCount: 21,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(
                        AppRoutes.subCategory.name,
                        extra: {
                          "categoryName": "Proten",
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
                            imagePath: "assets/images/bottle.png",
                            height: 70.h,
                          ),
                          Gap(5.h),
                          Text(
                            "Proten",
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
  }
}
