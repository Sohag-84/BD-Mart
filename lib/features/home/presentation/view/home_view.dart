import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/config/app_config.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/core/widgets/slider_image.dart';
import 'package:gym_swat/features/category/presentation/bloc/feature_category/feature_category_bloc.dart';
import 'package:gym_swat/features/home/presentation/bloc/home_bloc.dart';
import 'package:gym_swat/features/home/presentation/part/all_product_section.dart';
import 'package:gym_swat/features/home/presentation/part/category_section.dart';
import 'package:gym_swat/features/home/presentation/part/home_seach_bar.dart';
import 'package:gym_swat/features/product/presentation/bloc/product/product_bloc.dart';
import 'package:gym_swat/features/search/presentation/bloc/search_suggetion/search_suggetion_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String url = AppConfig.featureudCategory;
  final productUrl = AppConfig.products;
  late ProductBloc productBloc;
  @override
  void initState() {
    super.initState();
    productBloc = context.read<ProductBloc>();
    context.read<HomeBloc>().add(HomeSliderFetchedEvent());
    // Fetch only if not already loaded
    final bloc = context.read<FeatureCategoryBloc>();
    if (bloc.state is! FeatureCategoryLoaded) {
      bloc.add(FeatureCategoryFetch(url: url));
    }
    productBloc.add(ProductFetchedEvent(url: productUrl));
    context.read<SearchSuggetionBloc>().add(
          const FetchedSearchSuggetions(query: ""),
        );
  }

  @override
  Widget build(BuildContext context) {
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
              onTap: () {
                context.pushNamed(AppRoutes.search.name);
              },
            ),
          ],
        ),
      ),
      body: refresh(
        onRefresh: () {
          context.read<HomeBloc>().add(HomeSliderFetchedEvent());
          context
              .read<FeatureCategoryBloc>()
              .add(FeatureCategoryFetch(url: url, forceToLoadData: true));
          context.read<ProductBloc>().add(
                ProductFetchedEvent(url: AppConfig.products, isRefresh: true),
              );
        },
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent &&
                !productBloc.hasReachedMax) {
              productBloc.add(ProductFetchedEvent(url: productUrl));
            }
            return false;
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) =>
                      current is HomeSliderLoaded ||
                      current is HomeSliderLoading ||
                      current is HomeSliderLoadingError,
                  builder: (context, state) {
                    if (state is HomeSliderLoading) {
                      return SizedBox(
                        height: 160.h,
                        child: Center(child: loader()),
                      );
                    } else if (state is HomeSliderLoadingError) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else if (state is HomeSliderLoaded) {
                      return homeSlider(
                        imageList: state.sliderList
                            .map((slider) => slider.photo)
                            .toList(),
                        boxFit: BoxFit.fill,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
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
        ),
      ),
    );
  }
}
