import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';

AppBar customAppBar({
  required BuildContext context,
  required String title,
  bool isSearchButton = true,
}) {
  return AppBar(
    title: Text(title),
    actions: [
      isSearchButton
          ? IconButton(
              icon: Icon(
                Icons.search,
                size: 30.h,
              ),
              onPressed: () {
                context.pushNamed(AppRoutes.search.name);
              },
            )
          : const SizedBox(),
    ],
  );
}
