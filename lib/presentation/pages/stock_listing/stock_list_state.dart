import 'package:stock_app/data/model/stock_response.dart';

abstract class StockListState {
  const StockListState();
}

class StockListLoading extends StockListState {}

class StockListLoaded extends StockListState {
  final List<StockResponse>? list;

  const StockListLoaded(this.list);
}

class StockListError extends StockListState {
  final String errorMessage;

  const StockListError(this.errorMessage);
}
