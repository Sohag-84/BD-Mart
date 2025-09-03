import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/features/cart/presentation/cubit/cart_counter/cart_counter_cubit.dart';
import 'package:gym_swat/features/cart/presentation/view/cart_view.dart';
import 'package:gym_swat/features/category/presentation/views/category_view.dart';
import 'package:gym_swat/features/home/presentation/view/home_view.dart';
import 'package:gym_swat/features/profile/view/profile_view.dart';
import 'package:badges/badges.dart' as badges;

Widget buildPage({required int index}) {
  List<Widget> pageList = const [
    HomeView(),
    CategoryView(),
    CartView(),
    ProfileView(),
  ];
  return pageList[index];
}

var bottomTabs = [
  const BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: "Home",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.dashboard_outlined),
    label: "Category",
  ),
  BottomNavigationBarItem(
    icon: BlocBuilder<CartCounterCubit, CartCounterState>(
      builder: (context, state) {
        int count = 0;

        if (state is CartCounterLoaded) {
          count = state.counterEntity.cartItemCount ?? 0;
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: badges.Badge(
            position: badges.BadgePosition.topEnd(
              top: -10,
              end: -15,
            ),
            showBadge: count > 0,
            badgeContent: Text(
              '$count',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            badgeAnimation: const badges.BadgeAnimation.scale(
              animationDuration: Duration(seconds: 1),
              colorChangeAnimationDuration: Duration(seconds: 1),
              loopAnimation: false,
              curve: Curves.fastOutSlowIn,
              colorChangeAnimationCurve: Curves.easeInCubic,
            ),
            child: const Icon(Icons.shopping_cart_outlined),
          ),
        );
      },
    ),
    label: "Cart",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.person_outline_outlined),
    label: "Account",
  ),
];
