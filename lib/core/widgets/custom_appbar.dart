import 'package:gym_swat/core/constants/exports.dart';

AppBar customAppBar({
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
              onPressed: () {},
            )
          : const SizedBox(),
    ],
  );
}
