part of 'order_status_bloc.dart';

sealed class OrderStatusState extends Equatable {
  const OrderStatusState();

  @override
  List<Object> get props => [];
}

final class OrderStatusInitial extends OrderStatusState {}

final class AllOrderLoading extends OrderStatusState {}

final class AllOrderLoaded extends OrderStatusState {
  final List<OrderModel> orderList;

  const AllOrderLoaded({required this.orderList});

  @override
  List<Object> get props => [orderList];
}

final class AllOrderFailure extends OrderStatusState {
  final String error;

  const AllOrderFailure({required this.error});

  @override
  List<Object> get props => [error];
}

//for track order
final class TrackOrderLoading extends OrderStatusState {}

final class TrackOrderLoaded extends OrderStatusState {
  final List<TrackOrderModel> orderList;

  const TrackOrderLoaded({required this.orderList});

  @override
  List<Object> get props => [orderList];
}

final class TrackOrderFailure extends OrderStatusState {
  final String error;

  const TrackOrderFailure({required this.error});

  @override
  List<Object> get props => [error];
}
