part of 'order_status_bloc.dart';

sealed class OrderStatusEvent extends Equatable {
  const OrderStatusEvent();

  @override
  List<Object> get props => [];
}

final class FetchedAllOrder extends OrderStatusEvent {
  final int page;

  const FetchedAllOrder({required this.page});

  @override
  List<Object> get props => [page];
}
