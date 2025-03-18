import 'package:get/get.dart';
import 'package:gym_swat/features/bottom_nav/view/bottom_nav_view.dart';
import 'package:gym_swat/features/cart/view/cart_view.dart';
import 'package:gym_swat/features/cart/view/shipping_details_view.dart';
import 'package:gym_swat/features/category/views/category_view.dart';
import 'package:gym_swat/features/category/views/sub_category_view.dart';
import 'package:gym_swat/features/splash/view/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static List<GetPage> routes = [
    ///splash page
    GetPage(
      transition: Transition.downToUp,
      name: AppRoutes.INITIAL,
      page: () => const SplashView(),
    ),

    ///bottom navbar page
    GetPage(
      transition: Transition.downToUp,
      name: AppRoutes.BOTTOM_NAVIGATION,
      page: () => const BottomNavView(),
    ),

    ///category page
    GetPage(
      transition: Transition.downToUp,
      name: AppRoutes.CATEGORY,
      page: () => const CategoryView(),
    ),

    ///sub-category page
    GetPage(
      transition: Transition.downToUp,
      name: AppRoutes.SUB_CATEGORY,
      page: () => const SubCategoryView(),
    ),

    ///cart
    GetPage(
      transition: Transition.downToUp,
      name: AppRoutes.CART,
      page: () => const CartView(),
    ),

    ///cart
    GetPage(
      transition: Transition.downToUp,
      name: AppRoutes.SHIPPING_DETAILS,
      page: () => const ShippingDetailsView(),
    ),
  ];
}
