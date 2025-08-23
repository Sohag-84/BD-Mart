import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/core/widgets/custom_product_container.dart';
import 'package:gym_swat/features/search/domain/entity/search_suggetions_entity.dart';
import 'package:gym_swat/features/search/presentation/bloc/search_product/search_product_bloc.dart';
import 'package:gym_swat/features/search/presentation/bloc/search_suggetion/search_suggetion_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final queryController = TextEditingController();

  @override
  void initState() {
    context.read<SearchSuggetionBloc>().add(
          const FetchedSearchSuggetions(query: "Nevia"),
        );
    context.read<SearchProductBloc>().add(
          const FetchedSearchProduct(query: ""),
        );

    super.initState();
  }

  @override
  void dispose() {
    queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Row(
              children: [
                // Back button
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 25.h,
                    color: AppColors.whiteColor,
                  ),
                ),
                Gap(5.w),
                Expanded(
                  child: SizedBox(
                    height: 43.h,
                    child:
                        BlocBuilder<SearchSuggetionBloc, SearchSuggetionState>(
                      builder: (context, state) {
                        if (state is SearchSuggetionFailure) {
                          return const Text("");
                        } else if (state is SearchSuggetionLoaded) {
                          return Autocomplete<SearchSuggetionsEntity>(
                            optionsBuilder: (TextEditingValue value) {
                              if (value.text.isEmpty) {
                                return List.empty();
                              } else {
                                return state.suggetions.where(
                                  (suggetion) => suggetion.query!
                                      .toLowerCase()
                                      .contains(value.text.toLowerCase()),
                                );
                              }
                            },
                            displayStringForOption: (option) =>
                                option.query.toString(),
                            fieldViewBuilder: (context, textEditingController,
                                focusNode, onFieldSubmitted) {
                              textEditingController.text =
                                  queryController.text.trim();
                              return TextField(
                                controller: textEditingController,
                                focusNode: focusNode,
                                cursorColor: AppColors.darkCharcoal,
                                onChanged: (value) {
                                  queryController.text = value;
                                  context.read<SearchSuggetionBloc>().add(
                                        FetchedSearchSuggetions(query: value),
                                      );
                                },
                                onSubmitted: (value) {
                                  queryController.text =
                                      textEditingController.text.trim();
                                  FocusScope.of(context).unfocus();
                                },
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: AppColors.darkCharcoal,
                                ),
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 45.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8.r),
                                          bottomRight: Radius.circular(8.r),
                                        ),
                                      ),
                                      child: const Icon(Icons.search),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 2,
                                  ),
                                  hintText: "Search here....",
                                  hintStyle: TextStyle(
                                    fontSize: 13.sp,
                                    color: AppColors.blackColor,
                                  ),
                                  fillColor: AppColors.whiteColor,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: BorderSide(
                                      color: AppColors.whiteColor
                                          .withValues(alpha: 0.5),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: const BorderSide(
                                      color: AppColors.lightGreyColor,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Text("data not found");
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: BlocBuilder<SearchProductBloc, SearchProductState>(
          builder: (context, state) {
            if (state is SearchProductLoading) {
              return loader();
            } else if (state is SearchProductFailure) {
              return const Center(
                child: Text("Something went wrong"),
              );
            } else if (state is SearchProductLoaded) {
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 15.w,
                  mainAxisExtent: 290.h,
                ),
                itemCount: state.products.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = state.products[index];
                  return customProductContainer(
                    onTap: () {
                      context.pushNamed(
                        AppRoutes.productDetails.name,
                        extra: {
                          "productId": product.id.toString(),
                        },
                      );
                    },
                    image: product.thumbnailImage ?? defaultLogo,
                    productName: product.name ?? "",
                    discount: "${product.discount}",
                    discountPrice: "200",
                    sellingPrice: product.mainPrice ?? "",
                  );
                },
              );
            }
            return const Text("data");
          },
        ),
      ),
    );
  }
}
