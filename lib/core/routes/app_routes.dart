part of 'app_pages.dart';

class AppRoutes {
  static Route splash = Route(name: "Splash", path: "/");

  static Route bottomNavbar = Route(
    name: "Bottom Navigation",
    path: "/bottom-nav-view",
  );

  static Route login = Route(
    name: "Login",
    path: "/login",
  );

  static Route signup = Route(
    name: "Signup",
    path: "/signup",
  );

  static Route category = Route(
    name: "Category",
    path: "/category",
  );

  static Route subCategory = Route(
    name: "Sub Category",
    path: "/sub-category",
  );
  static Route cart = Route(
    name: "Cart",
    path: "/cart",
  );
  static Route shippingDetails = Route(
    name: "Shipping Details",
    path: "/shipping-details",
  );

  static Route product = Route(
    name: "Product",
    path: "/product",
  );

  static Route productDetails = Route(
    name: "Product Details",
    path: "/product-details",
  );
}

class Route {
  final String name;
  final String path;

  Route({required this.name, required this.path});
}
