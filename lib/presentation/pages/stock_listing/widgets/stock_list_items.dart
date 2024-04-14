import 'package:flutter/material.dart';
import 'package:stock_app/data/model/stock_response.dart';
import 'package:stock_app/presentation/utils/enums/tag_color_names.dart';

class StockListItem extends StatelessWidget {
  const StockListItem({super.key, required this.stock});

  final StockResponse? stock;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stock?.name ?? '',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            stock?.tag ?? '',
            style: TextStyle(
              fontSize: 12,
              color: TagColorNames.fromColorName(stock?.color ?? '').color,
            ),
          ),
        ],
      ),
    );
  }
}
