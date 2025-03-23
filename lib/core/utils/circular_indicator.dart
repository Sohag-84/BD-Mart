import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
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
              child: loader,
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

var loader = Center(
  child: Image.asset(
    refreshIcon,
    height: 60.h,
    width: 60.w,
  ),
);
