import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/features/category/presentation/part/category_product_section.dart';
import 'package:gym_swat/features/category/presentation/part/sub_category_animated_row_section.dart';

class SubCategoryView extends StatelessWidget {
  final String categoryName;
  const SubCategoryView({super.key,required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: categoryName),
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
