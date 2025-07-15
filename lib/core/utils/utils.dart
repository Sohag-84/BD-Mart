import 'package:any_image_view/any_image_view.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gym_swat/core/constants/exports.dart';

//image container
Widget customImage({
  String? imagePath,
  double? width,
  double? height,
}) {
  return AnyImageView(
    imagePath: imagePath ?? deafultLogo,
    height: height ?? height,
    width: width ?? width,
    boxFit: BoxFit.fill,
    borderRadius: BorderRadius.circular(8.r),
    errorPlaceHolder: deafultLogo,
  );
}

///set box shadow
List<BoxShadow> boxShadow = [
  BoxShadow(
    color: Colors.black.withValues(alpha: .1),
    blurRadius: 2,
    offset: const Offset(0.1, 5),
  ),
  BoxShadow(
    color: Colors.black.withValues(alpha: .1),
    blurRadius: 2,
    offset: const Offset(-0.7, -0.7),
  ),
];

Widget dataNotFound() {
  return const Center(child: Text("No products found"));
}

Widget paginationLoader() {
  return const SpinKitThreeBounce(
    color: AppColors.primaryColor,
    size: 24.0,
  );
}

///for rating bar
RatingBarIndicator ratingBar({
  required double ratings,
  double starSize = 12.0,
}) {
  return RatingBarIndicator(
    rating: ratings,
    itemBuilder: (context, index) => const Icon(
      Icons.star,
      color: Colors.amber,
    ),
    itemCount: 5,
    itemSize: starSize,
    direction: Axis.horizontal,
  );
}
