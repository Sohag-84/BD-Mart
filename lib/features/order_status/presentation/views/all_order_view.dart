import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/features/order_status/presentation/bloc/order_status_bloc.dart';
import 'package:gym_swat/features/order_status/presentation/widgets/all_order_item_container.dart';

class AllOrderView extends StatefulWidget {
  const AllOrderView({super.key});

  @override
  State<AllOrderView> createState() => _AllOrderViewState();
}

class _AllOrderViewState extends State<AllOrderView> {
  @override
  void initState() {
    super.initState();
    context.read<OrderStatusBloc>().add(const FetchedAllOrder(page: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Orders"),
      ),
      body: BlocBuilder<OrderStatusBloc, OrderStatusState>(
        builder: (context, state) {
          if (state is AllOrderLoading) {
            return loader();
          } else if (state is AllOrderFailure) {
            return Center(child: Text(state.error));
          } else if (state is AllOrderLoaded) {
            return ListView.builder(
              itemCount: state.orderList.length,
              itemBuilder: (BuildContext context, int index) {
                final order = state.orderList[index];
                return AllOrderItemContainer(
                  orderId: order.code,
                  date: order.date,
                  paymentStatus: order.paymentStatus,
                  deliveryStatus: order.deliveryStatus,
                  deliveryStatusColor: order.deliveryStatus == 'delivered'
                      ? AppColors.greenColor
                      : AppColors.darkGrey,
                  price: order.grandTotal,
                  paymentStatusColor: order.paymentStatus == 'paid'
                      ? AppColors.greenColor
                      : Colors.red,
                  onTap: () {},
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
