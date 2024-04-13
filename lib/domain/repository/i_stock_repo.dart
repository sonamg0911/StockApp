import 'dart:async';

import '../../data/model/stock_response.dart';

abstract class IStockRepo {
  FutureOr<List<StockResponse>?> getStocks();
}
