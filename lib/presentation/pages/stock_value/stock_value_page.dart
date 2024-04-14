import 'package:flutter/material.dart';

class StockValuePage extends StatefulWidget {
  static const path = "/data";

  const StockValuePage({super.key});

  @override
  StockValuePageState createState() => StockValuePageState();
}

class StockValuePageState extends State<StockValuePage> {
  @override
  Widget build(BuildContext context) {
    final variableValueMap =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
      ),
      body: ListView.builder(
        itemCount: variableValueMap!['values'].length ?? 0,
        itemBuilder: (context, itemNumber) {
          final value = variableValueMap['values'].elementAt(itemNumber);
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
              value.toString(),
              style: const TextStyle(fontSize: 16),
            ),
          );
        },
      ),
    );
  }
}
