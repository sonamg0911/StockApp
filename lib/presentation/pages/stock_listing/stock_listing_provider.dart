import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_app/di/di_config.dart';
import 'package:stock_app/domain/usecase/stock_list_usecase.dart';
import 'package:stock_app/presentation/pages/stock_listing/stock_list_state.dart';

class StockListingProvider extends StateNotifier<StockListState> {
  StockListingProvider() : super(StockListLoading());

  void getStocks() async {
    try {
      final response = await getIt<StockListUseCase>().getStocks();
        state = StockListLoaded(response);
    } catch (e) {
      state = StockListError(e.toString());
    }
  }
}
