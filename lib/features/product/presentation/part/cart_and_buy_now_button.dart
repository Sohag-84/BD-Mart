import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/core/widgets/custom_button.dart';
import 'package:gym_swat/features/cart/presentation/bloc/add_to_cart/add_to_cart_bloc.dart';
import 'package:gym_swat/features/cart/presentation/bloc/buy_now/buy_now_bloc.dart';

class CartAndBuyNowButton extends StatefulWidget {
  final String productId;
  const CartAndBuyNowButton({super.key, required this.productId});

  @override
  State<CartAndBuyNowButton> createState() => _CartAndBuyNowButtonState();
}

class _CartAndBuyNowButtonState extends State<CartAndBuyNowButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// ADD TO CART BUTTON
        Expanded(
          child: BlocConsumer<AddToCartBloc, AddToCartState>(
            listener: (context, state) {
              if (state is AddToCartSuccess) {
                Fluttertoast.showToast(msg: state.message);
              } else if (state is AddToCartFailure) {
                Fluttertoast.showToast(msg: state.error);
              }
            },
            builder: (context, state) {
              if (state is AddToCartLoading) {
                return customButton(
                  onTap: () {},
                  btnText: "Adding...",
                );
              }
              return customButton(
                onTap: () {
                  context.read<AddToCartBloc>().add(
                        AddedToCart(
                          productId: widget.productId,
                          variant: "",
                          color: "",
                          quantity: "1",
                        ),
                      );
                },
                btnText: "Add to Cart",
              );
            },
          ),
        ),
        Gap(30.w),

        /// BUY NOW BUTTON
        Expanded(
          child: BlocConsumer<BuyNowBloc, BuyNowState>(
            listener: (context, state) {
              if (state is BuyNowSuccess) {
                Fluttertoast.showToast(msg: state.message);
                context.pushNamed(AppRoutes.cart.name);
              } else if (state is BuyNowFailure) {
                Fluttertoast.showToast(msg: state.error);
              }
            },
            builder: (context, state) {
              if (state is BuyNowLoading) {
                return customButton(
                  onTap: () {},
                  btnText: "Adding...",
                );
              }
              return customButton(
                onTap: () {
                  context.read<BuyNowBloc>().add(
                        AddedBuyNow(
                          productId: widget.productId,
                          variant: "",
                          color: "",
                          quantity: "1",
                        ),
                      );
                },
                btnText: "Buy Now",
              );
            },
          ),
        ),
      ],
    );
  }
}
