import 'package:flutter_test/flutter_test.dart';
import 'package:stock_app/domain/repository/mock_stock_repo.dart';

void main() {
  test('on calling getStocks in stock_repo should return response if status is ok', () async {
    final repo = MockStockRepo();
    final response = await repo.getStocks();
    expect(response?.isEmpty, false);
  });
}
