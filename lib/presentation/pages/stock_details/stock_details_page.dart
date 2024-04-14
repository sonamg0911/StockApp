import 'package:flutter/material.dart';
import 'package:stock_app/data/model/stock_response.dart';
import 'package:stock_app/presentation/utils/tag_color_names.dart';

class StockDetailPage extends StatefulWidget {
  static const path = "/details";

  const StockDetailPage({super.key});

  @override
  StockDetailPageState createState() => StockDetailPageState();
}

class StockDetailPageState extends State<StockDetailPage> {
  @override
  Widget build(BuildContext context) {
    final stock = ModalRoute.of(context)!.settings.arguments as StockResponse;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white60,
        title: Text(
          stock.name,
          maxLines: 2,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Center(
              child: Text(
                stock.tag,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: TagColorNames.fromColorName(stock.color).color,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: stock.criteria?.length,
        itemBuilder: (context, itemNumber) {
          final criteria = stock.criteria?.elementAt(itemNumber);
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(StockDetailPage.path, arguments: stock);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: const EdgeInsets.symmetric(
                vertical: 5,
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
              child: Text(
                criteria?.text ?? '',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
