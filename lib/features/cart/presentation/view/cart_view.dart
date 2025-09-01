import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/core/widgets/custom_icon_button.dart';
import 'package:gym_swat/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:gym_swat/features/cart/presentation/part/amount_and_shipping_button.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(FetchedCartItem());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: cart, context: context),
      bottomNavigationBar: amountAndShippingButton(
        totalAmount: "1290",
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
              Fluttertoast.showToast(msg: "Item deleted successfully");
            }
          },
          builder: (context, state) {
            if (state is CartLoading) {
              return loader();
            } else if (state is CartFailure) {
              return const Center(child: Text("Something went wrong"));
            } else if (state is CartLoaded) {
              if (state.cartItemList.isEmpty) {
                return dataNotFound();
              }
              return ListView.builder(
                itemCount: state.cartItemList.length,
                itemBuilder: (BuildContext context, int shopIndex) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.cartItemList[shopIndex].cartItems.length,
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
                            margin: EdgeInsets.symmetric(
                              vertical: 5.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: boxShadow,
                            ),
                            child: Row(
                              children: [
                                ///image
                                customImage(
                                  imagePath: cartItem.productThumbnailImage,
                                  height: 80.h,
                                  width: 90.w,
                                ),
                                Gap(5.w),

                                ///name || price || delete
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //name
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

                                      ///[for product variant]
                                      // cartItem.variation == null
                                      //     ? Container()
                                      //     : Text(
                                      //         cartItem.variation ?? "",
                                      //         maxLines: 2,
                                      //         overflow: TextOverflow.ellipsis,
                                      //         style: TextStyle(
                                      //           fontSize: 10.sp,
                                      //           fontWeight: FontWeight.w500,
                                      //           color: AppColors.lightGreyColor,
                                      //         ),
                                      //       ),
                                      Gap(5.h),
                                      //price & delete
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
                                          //delete button
                                          InkWell(
                                            onTap: () {
                                              context.read<CartBloc>().add(
                                                    DeletedCartItem(
                                                      productId: cartItem.id
                                                          .toString(),
                                                    ),
                                                  );
                                            },
                                            child: Icon(
                                              Icons.delete_outline,
                                              color: Colors.redAccent
                                                  .withValues(alpha: .70),
                                            ),
                                          ),
                                        ],
                                      ),

                                      ///quantity
                                      Row(
                                        children: [
                                          customIconButton(
                                            onTap: () {
                                              // if (cartItem.quantity! <= 1) {
                                              //   return;
                                              // }

                                              // controller.updateCartQuantity(
                                              //   productId: cartItem.id.toString(),
                                              //   quantity: "${cartItem.quantity! - 1}",
                                              // );
                                            },
                                            icon: FontAwesomeIcons.minus,
                                            padding: 3,
                                            iconColor: AppColors.secondaryColor,
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
                                              // controller.updateCartQuantity(
                                              //   productId: cartItem.id.toString(),
                                              //   quantity: "${cartItem.quantity! + 1}",
                                              // );
                                            },
                                            icon: Icons.add,
                                            padding: 3,
                                            bgColor: AppColors.darkCharcoal,
                                            iconColor: AppColors.secondaryColor,
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
