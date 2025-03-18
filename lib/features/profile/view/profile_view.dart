import 'package:gym_swat/core/constants/exports.dart';
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
    return Scaffold(
      appBar: customAppBar(
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
                  onTap: () {},
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
