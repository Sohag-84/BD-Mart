import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/features/category/part/category_product_section.dart';
import 'package:gym_swat/features/category/part/sub_category_animated_row_section.dart';

class SubCategoryView extends StatelessWidget {
  const SubCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = Get.arguments;
    final String categoryName = args?["categoryName"] ?? "No Name";

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
