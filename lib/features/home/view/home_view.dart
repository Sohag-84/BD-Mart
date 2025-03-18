import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/widgets/slider_image.dart';
import 'package:gym_swat/features/home/part/all_product_section.dart';
import 'package:gym_swat/features/home/part/category_section.dart';
import 'package:gym_swat/features/home/part/home_seach_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      "assets/images/slider_1.png",
      "assets/images/slider_1.png",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              homeAppBarLogo,
              height: 40.h,
              width: 40.w,
              fit: BoxFit.fill,
            ),
            Gap(5.w),
            homeSearchBar(
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            homeSlider(
              imageList: imageList,
              boxFit: BoxFit.fill,
            ),
            const Gap(10),

            ///others section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///categories
                  const CategorySection(),
                  Gap(15.h),

                  allProductsSection(context: context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
