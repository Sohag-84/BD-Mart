import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/core/widgets/custom_icon_button.dart';
import 'package:gym_swat/features/cart/presentation/part/amount_and_shipping_button.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: cart),
      bottomNavigationBar: amountAndShippingButton(
        totalAmount: "1290",
        onTap: () {
          context.pushNamed(AppRoutes.shippingDetails.name);
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  // context.pushNamed(
                  //   AppRoutes.productDetails.name,
                  //   extra: {
                  //     "productId": product.id.toString(),
                  //   },
                  // );
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
                        imagePath: 'assets/images/bottle.png',
                        height: 80.h,
                        width: 90.w,
                      ),
                      Gap(5.w),

                      ///name || price || delete
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //name
                            Text(
                              "Nitro Tech Protein",
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "$takaSign 1200",
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
                                    // delete item from cart
                                  },
                                  child: Icon(
                                    Icons.delete_outline,
                                    color: Colors.redAccent.withOpacity(.70),
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
                                  "10",
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
            }),
      ),
    );
  }
}
