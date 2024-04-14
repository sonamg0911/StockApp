import 'package:flutter/material.dart';
import 'package:stock_app/data/model/stock_response.dart';
import 'package:stock_app/presentation/utils/enums/criteria_type.dart';
import 'package:stock_app/presentation/utils/enums/tag_color_names.dart';
import 'package:stock_app/presentation/utils/enums/variable_type.dart';

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
      body: ListView.separated(
        itemCount: stock.criteria?.length ?? 0,
        separatorBuilder: (context, index) {
          return Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: const Text(
              'and',
              style: TextStyle(fontSize: 10),
            ),
          );
        },
        itemBuilder: (context, itemNumber) {
          final criteria = stock.criteria?.elementAt(itemNumber);
          return Container(
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
                width: 1,
              ),
            ),
            child: Text(
              criteria?.type == CriteriaType.plainText.type
                  ? criteria?.text ?? ''
                  : getVariableText(criteria?.text ?? '', criteria?.variable),
              style: const TextStyle(fontSize: 16),
            ),
          );
        },
      ),
    );
  }

  String getVariableText(String input, Map<String, dynamic>? valueMap) {
    String result = input;

    valueMap?.forEach((key, value) {
      if (value.containsKey('type')) {
        if (value['type'] == VariableType.value.name) {
          if(value.containsKey('values') && value['values'].isNotEmpty) {
            result = result.replaceAll(key, value['values'].elementAt(0).toString());
          }
        } else {
          if (value.containsKey('default_value')) {
            result =
                result.replaceAll(key, value['default_value'].toString());
          }
        }
      }
    });

    return result;
  }
}
