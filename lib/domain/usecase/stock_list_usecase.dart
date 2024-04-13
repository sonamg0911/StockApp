import 'package:stock_app/data/model/stock_response.dart';
import 'package:stock_app/di/di_config.dart';
import 'package:stock_app/domain/repository/i_stock_repo.dart';
import 'package:injectable/injectable.dart';

@devEnv
@prodEnv
@testEnv
@injectable
class StockListUseCase {
  final IStockRepo stockRepo;

  StockListUseCase(this.stockRepo);

  Future<List<StockResponse>?> getStocks() async {
    return await stockRepo.getStocks();
  }
}
