import 'package:flutter/material.dart';
import 'package:gym_swat/features/profile/view/profile_view.dart';
import 'package:gym_swat/features/cart/presentation/view/cart_view.dart';
import 'package:gym_swat/features/category/views/category_view.dart';
import 'package:gym_swat/features/home/presentation/view/home_view.dart';

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
  const BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart_outlined),
    label: "Cart",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.person_outline_outlined),
    label: "Account",
  ),
];
