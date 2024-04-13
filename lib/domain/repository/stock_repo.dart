import 'dart:async';

import 'package:stock_app/data/model/stock_response.dart';
import 'package:injectable/injectable.dart';
import '../../data/services/api_services.dart';
import '../../di/di_config.dart';
import 'i_stock_repo.dart';

@devEnv
@prodEnv
@Injectable(as: IStockRepo)
class StockRepo extends IStockRepo {
  @override
  Future<List<StockResponse>?> getStocks() async {
    return await getIt<ApiServices>().getStocks();
  }
}
