import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/features/category/presentation/part/category_product_section.dart';
import 'package:gym_swat/features/category/presentation/part/sub_category_animated_row_section.dart';
import 'package:gym_swat/features/product/presentation/bloc/product_bloc.dart';

class SubCategoryView extends StatefulWidget {
  final String categoryName;
  final String url;
  const SubCategoryView({
    super.key,
    required this.categoryName,
    required this.url,
  });

  @override
  State<SubCategoryView> createState() => _SubCategoryViewState();
}

class _SubCategoryViewState extends State<SubCategoryView> {
  @override
  void initState() {
    super.initState();
    print("URL: ${widget.url}");
    context.read<ProductBloc>().add(ProductFetchedEvent(url: widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: widget.categoryName),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header
            subcategoryRowSection(),
            //body
            Padding(
              padding: EdgeInsets.all(5.w),
              child: categoryProductsSection(),
            ),
          ],
        ),
      ),
    );
  }
}
