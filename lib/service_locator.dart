import 'package:get_it/get_it.dart';
import 'package:gym_swat/core/services/api_services.dart';
import 'package:gym_swat/features/address/address_injection_container.dart';
import 'package:gym_swat/features/auth/auth_injection_container.dart';
import 'package:gym_swat/features/cart/cart_injection_container.dart';
import 'package:gym_swat/features/category/category_injection_container.dart';
import 'package:gym_swat/features/home/home_injection_container.dart';
import 'package:gym_swat/features/policy/policy_injection_container.dart';
import 'package:gym_swat/features/product/product_injection_container.dart';
import 'package:gym_swat/features/search/search_injection_container.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  sl.registerLazySingleton<ApiServices>(() => ApiServices());

  await homeInjectionContainer();
  await productInjectionContainer();
  await categoryInjectionContainer();
  await authInjectionContainer();
  await policyInjectionContainer();
  await searchInjectionContainer();
  await cartInjectionContainer();
  await addressInjectionContainer();
}
