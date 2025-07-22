import 'package:any_image_view/any_image_view.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/utils/local_preferences.dart';

/// appbar section
Widget buildAppbarSection() {
  return Container(
    alignment: Alignment.center,
    height: 48,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ///profile image
        Padding(
          padding: const EdgeInsets.only(right: 14.0),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: AppColors.blackColor,
                width: 1,
              ),
            ),
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  100.0,
                ),
              ),
              child: AnyImageView(
                imagePath: "assets/images/bottle.png",
                boxFit: BoxFit.fill,
              ),
            ),
          ),
        ),

        /// user info
        Expanded(child: buildUserInfo()),
      ],
    ),
  );
}

/// user info
Widget buildUserInfo() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LocalPreferenceService.instance.getUsername(),
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              LocalPreferenceService.instance.getEmail(),
              style: const TextStyle(
                color: AppColors.blackColor,
              ),
            ),
          ),
        ],
      ),
      const Spacer(),
      InkWell(
        onTap: () {},
        child: const Icon(
          Icons.manage_accounts_outlined,
          size: 25,
        ),
      ),
    ],
  );
}
