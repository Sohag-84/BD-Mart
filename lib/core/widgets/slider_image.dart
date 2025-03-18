import 'package:any_image_view/any_image_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget homeSlider({
  required List imageList,
  double height = 160,
  int autoPlayInterval = 4,
  BoxFit boxFit = BoxFit.none,
}) {
  int activeIndex = 0;

  return StatefulBuilder(
    builder: (context, setState) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: height.h,
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayInterval: Duration(seconds: autoPlayInterval),
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
            items: imageList.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: AnyImageView(
                      imagePath: image,
                      height: 50,
                      boxFit: boxFit,
                      width: double.infinity,
                      //errorPlaceHolder: logo,
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Positioned(
            bottom: 15,
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: imageList.length,
              effect: SlideEffect(
                dotHeight: 3,
                dotWidth: 15,
                activeDotColor: AppColors.primaryColor.withOpacity(.7),
                dotColor: Colors.grey,
              ),
            ),
          ),
        ],
      );
    },
  );
}
