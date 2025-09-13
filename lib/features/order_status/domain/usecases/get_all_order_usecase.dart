import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/order_status/data/models/order_model.dart';
import 'package:gym_swat/features/order_status/domain/repository/order_status_repository.dart';

class GetAllOrderUsecase implements Usecase<List<OrderModel>, AllOrderParams> {
  final OrderStatusRepository orderStatusRepository;
  const GetAllOrderUsecase({required this.orderStatusRepository});

  @override
  ResultFuture<List<OrderModel>> call(AllOrderParams params) async {
    return orderStatusRepository.getAllOrder(
      page: params.page,
      paymentStatus: params.paymentStatus,
      deliveryStatus: params.deliveryStatus,
    );
  }
}

class AllOrderParams {
  final int page;
  final String? paymentStatus;
  final String? deliveryStatus;

  AllOrderParams({
    required this.page,
    required this.paymentStatus,
    required this.deliveryStatus,
  });
}
