import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/order_status/data/models/track_order_model.dart';
import 'package:gym_swat/features/order_status/domain/repository/order_status_repository.dart';

class TrackOrderUsecase
    implements Usecase<List<TrackOrderModel>, TrackOrderParam> {
  final OrderStatusRepository orderStatusRepository;
  const TrackOrderUsecase({required this.orderStatusRepository});

  @override
  ResultFuture<List<TrackOrderModel>> call(TrackOrderParam params) async {
    return await orderStatusRepository.trackOrder(
      orderCode: params.orderCode,
    );
  }
}

class TrackOrderParam {
  final String orderCode;

  TrackOrderParam({required this.orderCode});
}
