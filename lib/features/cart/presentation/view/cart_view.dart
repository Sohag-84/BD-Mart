import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/core/widgets/custom_icon_button.dart';
import 'package:gym_swat/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:gym_swat/features/cart/presentation/cubit/cart_counter/cart_counter_cubit.dart';
import 'package:gym_swat/features/cart/presentation/cubit/cart_summary/cart_summary_cubit.dart';
import 'package:gym_swat/features/cart/presentation/part/amount_and_shipping_button.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late CartBloc cartBloc;
  @override
  void initState() {
    super.initState();
    cartBloc = context.read<CartBloc>();
    cartBloc.add(FetchedCartItem());
    context.read<CartSummaryCubit>().fetchedCartSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: cart, context: context),
      bottomNavigationBar: amountAndShippingButton(
        onTap: () {
          context.pushNamed(AppRoutes.shippingDetails.name);
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: BlocConsumer<CartBloc, CartState>(
          listener: (context, state) {
            if (state is CartItemDeleteFailure) {
              Fluttertoast.showToast(msg: state.error);
            } else if (state is CartItemDeleteSuccess) {
            } else if (state is CartLoaded) {
              if (state.isUpdating) {
                EasyLoading.show();
              } else {
                EasyLoading.dismiss();
              }
            }
          },
          builder: (context, state) {
            if (state is CartLoading) {
              return loader();
            } else if (state is CartFailure) {
              return Center(child: Text(state.error));
            } else if (state is CartLoaded) {
              context.read<CartCounterCubit>().cartCounter();
              if (state.cartItemList.isEmpty) {
                return dataNotFound();
              }
              return refresh(
                onRefresh: () {
                  cartBloc.add(FetchedCartItem());
                },
                child: ListView.builder(
                  itemCount: state.cartItemList.length,
                  itemBuilder: (BuildContext context, int shopIndex) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            state.cartItemList[shopIndex].cartItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          final cartItem =
                              state.cartItemList[shopIndex].cartItems[index];

                          return InkWell(
                            onTap: () {
                              context.pushNamed(
                                AppRoutes.productDetails.name,
                                extra: {
                                  "productId": cartItem.id.toString(),
                                },
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(5.w),
                              margin: EdgeInsets.symmetric(vertical: 5.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: boxShadow,
                              ),
                              child: Row(
                                children: [
                                  customImage(
                                    imagePath: cartItem.productThumbnailImage,
                                    height: 80.h,
                                    width: 90.w,
                                  ),
                                  Gap(5.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartItem.productName ?? "",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                        Gap(5.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "$takaSign ${cartItem.price}",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                cartBloc.add(
                                                  DeletedCartItem(
                                                    productId:
                                                        cartItem.id.toString(),
                                                  ),
                                                );
                                              },
                                              child: Icon(
                                                Icons.delete_outline,
                                                color: Colors.redAccent
                                                    .withAlpha(180),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            customIconButton(
                                              onTap: () {
                                                if (cartItem.quantity! <= 1) {
                                                  return;
                                                }
                                                cartBloc.add(
                                                  UpdateCartQuantity(
                                                    productId:
                                                        cartItem.id.toString(),
                                                    newQuantity:
                                                        cartItem.quantity! - 1,
                                                  ),
                                                );
                                              },
                                              icon: FontAwesomeIcons.minus,
                                              padding: 3,
                                              iconColor:
                                                  AppColors.secondaryColor,
                                              bgColor: AppColors.darkCharcoal,
                                            ),
                                            Gap(10.w),
                                            Text(
                                              "${cartItem.quantity}",
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Gap(10.w),
                                            customIconButton(
                                              onTap: () {
                                                cartBloc.add(
                                                  UpdateCartQuantity(
                                                    productId:
                                                        cartItem.id.toString(),
                                                    newQuantity:
                                                        cartItem.quantity! + 1,
                                                  ),
                                                );
                                              },
                                              icon: Icons.add,
                                              padding: 3,
                                              bgColor: AppColors.darkCharcoal,
                                              iconColor:
                                                  AppColors.secondaryColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
