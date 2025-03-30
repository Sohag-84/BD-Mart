import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gym_swat/core/constants/exports.dart';

Widget refresh({
  required VoidCallback onRefresh,
  required Widget child,
}) {
  return CustomRefreshIndicator(
    onRefresh: () async {
      onRefresh();
    },
    builder: (context, child, controller) {
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          if (!controller.isIdle)
            Positioned(
              top: 20.0 * controller.value,
              child: imageLoader,
            ),
          Transform.translate(
            offset: Offset(0, 100.0 * controller.value),
            child: child,
          ),
        ],
      );
    },
    child: child,
  );
}

var imageLoader = Center(
  child: Image.asset(
    refreshIcon,
    height: 60.h,
    width: 60.w,
  ),
);

Widget loader({double height = 100}) {
  return Center(
    child: SizedBox(
      height: height,
      child: SpinKitFadingCube(
        color: AppColors.primaryColor,
        size: 25.h,
      ),
    ),
  );
}