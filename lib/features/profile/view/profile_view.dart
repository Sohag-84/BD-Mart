import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/utils/local_preferences.dart';
import 'package:gym_swat/features/auth/presentation/views/login_view.dart';
import 'package:gym_swat/features/profile/part/appbar_section.dart';
import 'package:gym_swat/features/profile/part/my_order_status_section.dart';
import 'package:gym_swat/features/profile/widgets/build_counter_row_item.dart';
import 'package:gym_swat/features/profile/widgets/build_porfile_icon_column.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> counterRowItemName = [
      cart,
      wishlist,
      myOrders,
    ];
    return LocalPreferenceService.instance.getToken().isEmpty
        ? const LoginView()
        : Scaffold(
            appBar: customAppBar(
              context: context,
              title: profile,
              isSearchButton: false,
            ),
            body: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                children: [
                  buildAppbarSection(),
                  Gap(25.h),
                  //order quantity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(3, (index) {
                      return buildCountersRowItem(
                        context: context,
                        onTap: () {
                          LocalPreferenceService.instance.removeToken();
                        },
                        counter: "10",
                        title: counterRowItemName[index],
                      );
                    }),
                  ),
                  Gap(20.h),

                  //my order status
                  buildMyOrdersSection(),
                  SizedBox(height: 55.h),

                  //footer section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        customProfileRow(),
                        Gap(30.h),
                        customProfileRow1(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
