import 'package:flutter/services.dart';
import 'package:gym_swat/core/constants/exports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
          return GetMaterialApp(
            title: 'GYM SWAT',
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
            initialRoute: AppRoutes.INITIAL,
            getPages: AppPages.routes,
          );
        });
  }
}
