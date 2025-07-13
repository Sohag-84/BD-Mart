import 'package:go_router/go_router.dart';
import 'package:gym_swat/features/bottom_nav/view/bottom_nav_view.dart';
import 'package:gym_swat/features/cart/presentation/view/cart_view.dart';
import 'package:gym_swat/features/cart/presentation/view/shipping_details_view.dart';
import 'package:gym_swat/features/category/presentation/views/category_view.dart';
import 'package:gym_swat/features/category/presentation/views/sub_category_view.dart';
import 'package:gym_swat/features/product/presentation/views/product_details_view.dart';
import 'package:gym_swat/features/splash/view/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static final router = GoRouter(
    initialLocation: AppRoutes.splash.path,
    routes: [
      ///Splash view
      GoRoute(
        path: AppRoutes.splash.path,
        name: AppRoutes.splash.name,
        builder: (context, state) => const SplashView(),
      ),

      ///Bottom navbar view
      GoRoute(
        path: AppRoutes.bottomNavbar.path,
        name: AppRoutes.bottomNavbar.name,
        builder: (context, state) => const BottomNavView(),
      ),

      ///Cart view
      GoRoute(
        path: AppRoutes.cart.path,
        name: AppRoutes.cart.name,
        builder: (context, state) => const CartView(),
      ),

      ///Category view
      GoRoute(
        path: AppRoutes.category.path,
        name: AppRoutes.category.name,
        builder: (context, state) => const CategoryView(),
      ),

      ///subcategory view
      GoRoute(
        path: AppRoutes.subCategory.path,
        name: AppRoutes.subCategory.name,
        builder: (context, state) => SubCategoryView(
          categoryName: (state.extra as Map)['categoryName'].toString(),
          productUrl: (state.extra as Map)['productUrl'].toString(),
          categoryId: (state.extra as Map)['categoryId'].toString(),
        ),
      ),

      ///product details view
      GoRoute(
        path: AppRoutes.productDetails.path,
        name: AppRoutes.productDetails.name,
        builder: (context, state) => const ProductDetailsView(),
      ),

      ///Shipping details view
      GoRoute(
        path: AppRoutes.shippingDetails.path,
        name: AppRoutes.shippingDetails.name,
        builder: (context, state) => const ShippingDetailsView(),
      ),
    ],
  );
}
