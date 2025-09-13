import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/order_status/domain/entities/order_status_entity.dart';
import 'package:gym_swat/features/order_status/domain/repository/order_status_repository.dart';

class GetOrderStatusUsecase implements Usecase<OrderStatusEntity, NoParams> {
  final OrderStatusRepository orderStatusRepository;

  GetOrderStatusUsecase({required this.orderStatusRepository});

  @override
  ResultFuture<OrderStatusEntity> call(NoParams params) async {
    return await orderStatusRepository.getOrderStatus();
  }
}
