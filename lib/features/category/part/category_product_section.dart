import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/widgets/custom_product_container.dart';
import 'package:gym_swat/features/product/presentation/views/product_details_view.dart';

Widget categoryProductsSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
          mainAxisExtent: 190.h,
        ),
        itemCount: 33,
        itemBuilder: (BuildContext context, int index) {
          return customProductContainer(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductDetailsView(),
                ),
              );
            },
            image: "assets/images/bottle.png",
            productName: "Nitro Tech Protein",
            discount: "10",
            discountPrice: "20",
            sellingPrice: "200",
            imageHeight: 100,
            nameFontSize: 10,
          );
        },
      ),
    ],
  );
}
