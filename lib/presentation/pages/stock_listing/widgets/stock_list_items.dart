import 'package:flutter/material.dart';
import 'package:stock_app/data/model/stock_response.dart';

class StockListItem extends StatelessWidget {
  const StockListItem({super.key, required this.stock});

  final StockResponse? stock;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Text(
        stock?.name ?? ''
      ),
    );
  }
}
