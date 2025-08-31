import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/core/utils/local_preferences.dart';
import 'package:gym_swat/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:gym_swat/features/auth/presentation/bloc/forget_password/forget_password_bloc.dart';
import 'package:gym_swat/features/auth/presentation/bloc/otp/otp_bloc.dart';
import 'package:gym_swat/features/auth/presentation/cubit/password_visibility_cubit.dart';
import 'package:gym_swat/features/cart/presentation/bloc/add_to_cart/add_to_cart_bloc.dart';
import 'package:gym_swat/features/cart/presentation/bloc/buy_now/buy_now_bloc.dart';
import 'package:gym_swat/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:gym_swat/features/cart/presentation/cubit/payment_method_cubit.dart';
import 'package:gym_swat/features/category/presentation/bloc/all_category/all_category_bloc.dart';
import 'package:gym_swat/features/category/presentation/bloc/category/category_bloc.dart';
import 'package:gym_swat/features/category/presentation/bloc/feature_category/feature_category_bloc.dart';
import 'package:gym_swat/features/category/presentation/bloc/sub_category/sub_category_bloc.dart';
import 'package:gym_swat/features/home/presentation/bloc/home_bloc.dart';
import 'package:gym_swat/features/policy/presentation/bloc/policy/policy_bloc.dart';
import 'package:gym_swat/features/policy/presentation/bloc/terms_conditions/terms_and_contions_bloc.dart';
import 'package:gym_swat/features/product/presentation/bloc/product/product_bloc.dart';
import 'package:gym_swat/features/product/presentation/bloc/product_details/product_details_bloc.dart';
import 'package:gym_swat/features/product/presentation/bloc/related_product/related_product_bloc.dart';
import 'package:gym_swat/features/search/presentation/bloc/search_product/search_product_bloc.dart';
import 'package:gym_swat/features/search/presentation/bloc/search_suggetion/search_suggetion_bloc.dart';
import 'package:gym_swat/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  LocalPreferenceService.instance.init();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => PasswordVisibilityCubit()),
              BlocProvider(create: (context) => PaymentMethodCubit()),
              BlocProvider(create: (context) => sl<AuthBloc>()),
              BlocProvider(create: (context) => sl<OtpBloc>()),
              BlocProvider(create: (context) => sl<ForgetPasswordBloc>()),
              BlocProvider(create: (context) => sl<PolicyBloc>()),
              BlocProvider(create: (context) => sl<TermsAndContionsBloc>()),
              BlocProvider(create: (context) => sl<HomeBloc>()),
              BlocProvider(create: (context) => sl<ProductBloc>()),
              BlocProvider(create: (context) => sl<ProductDetailsBloc>()),
              BlocProvider(create: (context) => sl<RelatedProductBloc>()),
              BlocProvider(create: (context) => sl<FeatureCategoryBloc>()),
              BlocProvider(create: (context) => sl<CategoryBloc>()),
              BlocProvider(create: (context) => sl<SubCategoryBloc>()),
              BlocProvider(create: (context) => sl<AllCategoryBloc>()),
              BlocProvider(create: (context) => sl<SearchSuggetionBloc>()),
              BlocProvider(create: (context) => sl<SearchProductBloc>()),
              BlocProvider(
                create: (context) => sl<CartBloc>()
                  ..add(
                    FetchedCartItem(),
                  ),
              ),
              BlocProvider(create: (context) => sl<AddToCartBloc>()),
              BlocProvider(create: (context) => sl<BuyNowBloc>()),
            ],
            child: MaterialApp.router(
              title: 'BD MART',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: "Montserrat",
                useMaterial3: true,
                appBarTheme: AppBarTheme(
                  backgroundColor: AppColors.blackColor,
                  centerTitle: true,
                  titleTextStyle: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteColor,
                  ),
                  actionsIconTheme: const IconThemeData(
                    color: AppColors.primaryColor,
                  ),
                  iconTheme: const IconThemeData(
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              routerConfig: AppPages.router,
              builder: EasyLoading.init(),
            ),
          );
        });
  }
}
