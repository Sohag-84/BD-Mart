import 'package:any_image_view/any_image_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gym_swat/core/constants/exports.dart';

//image container
Widget customImage({
  required String imagePath,
  double? width,
  double? height,
}) {
  return AnyImageView(
    imagePath: imagePath,
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
    color: Colors.black.withOpacity(.1),
    blurRadius: 2,
    offset: const Offset(0.1, 5),
  ),
  BoxShadow(
    color: Colors.black.withOpacity(.1),
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
