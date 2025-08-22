import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/features/product/domain/entity/product_entity.dart';

part 'search_product_event.dart';
part 'search_product_state.dart';

class SearchProductBloc extends Bloc<SearchProductEvent, SearchProductState> {
  SearchProductBloc() : super(SearchProductInitial()) {
    on<SearchProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
