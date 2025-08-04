import 'package:go_router/go_router.dart';
import 'package:gym_swat/features/auth/presentation/views/forget_password_view.dart';
import 'package:gym_swat/features/auth/presentation/views/login_view.dart';
import 'package:gym_swat/features/auth/presentation/views/otp_view.dart';
import 'package:gym_swat/features/auth/presentation/views/signup_view.dart';
import 'package:gym_swat/features/bottom_nav/view/bottom_nav_view.dart';
import 'package:gym_swat/features/cart/presentation/view/cart_view.dart';
import 'package:gym_swat/features/cart/presentation/view/shipping_details_view.dart';
import 'package:gym_swat/features/category/presentation/views/category_view.dart';
import 'package:gym_swat/features/category/presentation/views/sub_category_view.dart';
import 'package:gym_swat/features/product/presentation/views/product_details_view.dart';
import 'package:gym_swat/features/product/presentation/views/product_view.dart';
import 'package:gym_swat/features/search/presentation/view/search_view.dart';
import 'package:gym_swat/features/splash/view/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static final router = GoRouter(
    debugLogDiagnostics: true,
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

      ///Search view
      GoRoute(
        path: AppRoutes.search.path,
        name: AppRoutes.search.name,
        builder: (context, state) => const SearchView(),
      ),

      ///Login view
      GoRoute(
        path: AppRoutes.login.path,
        name: AppRoutes.login.name,
        builder: (context, state) => const LoginView(),
      ),

      ///Signup
      GoRoute(
        path: AppRoutes.signup.path,
        name: AppRoutes.signup.name,
        builder: (context, state) => const SignupView(),
      ),

      ///OTP Verification
      GoRoute(
        path: AppRoutes.otpVerification.path,
        name: AppRoutes.otpVerification.name,
        builder: (context, state) => OtpView(
          emailOrPhone: (state.extra as Map)["emailOrPhone"].toString(),
          userId: (state.extra as Map)["userId"].toString(),
        ),
      ),

      ///Forget password
      GoRoute(
        path: AppRoutes.forgetPassword.path,
        name: AppRoutes.forgetPassword.name,
        builder: (context, state) => const ForgetPasswordView(),
      ),

      ///Forget password otp submit
      GoRoute(
        path: AppRoutes.forgetPasswordOtpSubmit.path,
        name: AppRoutes.forgetPasswordOtpSubmit.name,
        builder: (context, state) => const ForgetPasswordView(),
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

      ///product view
      GoRoute(
        path: AppRoutes.product.path,
        name: AppRoutes.product.name,
        builder: (context, state) => ProductView(
          title: (state.extra as Map)['title'].toString(),
          url: (state.extra as Map)['url'].toString(),
          isPagination: (state.extra as Map)['isPagination'],
        ),
      ),

      ///product details view
      GoRoute(
        path: AppRoutes.productDetails.path,
        name: AppRoutes.productDetails.name,
        builder: (context, state) => ProductDetailsView(
          productId: (state.extra as Map)['productId'].toString(),
        ),
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
