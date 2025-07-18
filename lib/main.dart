import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/core/utils/local_preferences.dart';
import 'package:gym_swat/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:gym_swat/features/auth/presentation/cubit/password_visibility_cubit.dart';
import 'package:gym_swat/features/cart/presentation/cubit/payment_method_cubit.dart';
import 'package:gym_swat/features/category/presentation/bloc/all_category/all_category_bloc.dart';
import 'package:gym_swat/features/category/presentation/bloc/category/category_bloc.dart';
import 'package:gym_swat/features/category/presentation/bloc/feature_category/feature_category_bloc.dart';
import 'package:gym_swat/features/category/presentation/bloc/sub_category/sub_category_bloc.dart';
import 'package:gym_swat/features/home/presentation/bloc/home_bloc.dart';
import 'package:gym_swat/features/product/presentation/bloc/product/product_bloc.dart';
import 'package:gym_swat/features/product/presentation/bloc/product_details/product_details_bloc.dart';
import 'package:gym_swat/features/product/presentation/bloc/related_product/related_product_bloc.dart';
import 'package:gym_swat/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  LocalPreferenceService.instance.init();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
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
              BlocProvider(create: (context) => sl<HomeBloc>()),
              BlocProvider(create: (context) => sl<ProductBloc>()),
              BlocProvider(create: (context) => sl<ProductDetailsBloc>()),
              BlocProvider(create: (context) => sl<RelatedProductBloc>()),
              BlocProvider(create: (context) => sl<FeatureCategoryBloc>()),
              BlocProvider(create: (context) => sl<CategoryBloc>()),
              BlocProvider(create: (context) => sl<SubCategoryBloc>()),
              BlocProvider(create: (context) => sl<AllCategoryBloc>()),
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
