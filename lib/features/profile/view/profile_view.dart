import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/core/utils/local_preferences.dart';
import 'package:gym_swat/features/auth/presentation/views/login_view.dart';
import 'package:gym_swat/features/cart/presentation/cubit/cart_counter/cart_counter_cubit.dart';
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
    final state = context.read<CartCounterCubit>().state;
    int cartCount = 0;
    int wishlistCount = 0;
    int myOrdersCount = 0;
    if (state is CartCounterLoaded) {
      cartCount = state.counterEntity.cartItemCount ?? 0;
      wishlistCount = state.counterEntity.wishlistItemCount ?? 0;
      myOrdersCount = state.counterEntity.orderCount ?? 0;
    }
    List<int> cartCounter = [cartCount, wishlistCount, myOrdersCount];
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
                          if (index == 2) {
                            context.pushNamed(AppRoutes.allOrder.name);
                          }
                        },
                        counter: cartCounter[index].toString(),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customProfileRow(),
                        Gap(30.h),
                        customProfileRow1(),
                        Gap(30.h),
                        //logout
                        buildProfileIconColumn(
                          icon: Icons.logout,
                          title: "Logout",
                          onTap: () {
                            context.go(AppRoutes.splash.path);
                            LocalPreferenceService.instance.removeToken();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
