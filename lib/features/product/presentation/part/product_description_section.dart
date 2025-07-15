import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:gym_swat/core/constants/exports.dart';

class ProductDetailsDescriptionSection extends StatefulWidget {
  final String description1StPart;
  final String description;

  const ProductDetailsDescriptionSection({
    super.key,
    required this.description1StPart,
    required this.description,
  });

  @override
  State<ProductDetailsDescriptionSection> createState() =>
      _ProductDetailsDescriptionSectionState();
}

class _ProductDetailsDescriptionSectionState
    extends State<ProductDetailsDescriptionSection> {
  bool seeAll = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Product Details: ",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12.sp,
            color: Colors.grey,
          ),
        ),
        Gap(10.h),
        HtmlWidget(
          seeAll ? widget.description : "${widget.description1StPart}....",
          textStyle: TextStyle(
            fontSize: 12.sp,
          ),
        ),
        Gap(8.h),
        Center(
          child: InkWell(
            onTap: () {
              setState(() {
                seeAll = !seeAll;
              });
            },
            child: seeAll
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "See less",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_up_outlined)
                    ],
                  )
                : const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "See more",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down)
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
