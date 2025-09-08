import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/enums/payment_method.dart';
import 'package:gym_swat/features/cart/presentation/cubit/payment_method/payment_method_cubit.dart';

class SelectPaymentOptionButton extends StatelessWidget {
  final PaymentMethod method;
  const SelectPaymentOptionButton({super.key, required this.method});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentMethodCubit, PaymentMethod>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context
                .read<PaymentMethodCubit>()
                .selectPayment(paymentMethod: method);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 0.8,
                child: Radio<PaymentMethod>(
                  value: method,
                  groupValue: state,
                  activeColor: AppColors.greenColor,
                  onChanged: (value) {
                    if (value != null) {
                      context
                          .read<PaymentMethodCubit>()
                          .selectPayment(paymentMethod: value);
                    }
                  },
                ),
              ),
              Text(
                method.displayName.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 11.sp,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
