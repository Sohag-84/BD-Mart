import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/widgets/slider_image.dart';
import 'package:gym_swat/features/home/presentation/part/all_product_section.dart';
import 'package:gym_swat/features/home/presentation/part/category_section.dart';
import 'package:gym_swat/features/home/presentation/part/home_seach_bar.dart';

import '../bloc/home_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeCategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeCategoryLoadingFailure) {
            return const Center(
              child: Text('Failed to load data'),
            );
          } else if (state is HomeCategoryLoaded) {
            return SingleChildScrollView(
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
                         CategorySection(categoryList: state.categoryList),
                        Gap(15.h),

                        allProductsSection(context: context),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('No data'),
            );
          }
        },
      ),
    );
  }
}
