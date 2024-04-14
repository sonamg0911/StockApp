import 'package:flutter/material.dart';
import 'package:stock_app/presentation/pages/stock_details/stock_details_page.dart';
import 'package:stock_app/presentation/pages/stock_indicator/stock_indicator_page.dart';
import 'package:stock_app/presentation/pages/stock_listing/stock_listing_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_app/presentation/pages/stock_value/stock_value_page.dart';

import 'di/di_config.dart';

void main() {
  configureDependencies(Env.development);
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _themeData = ThemeData();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme:
            _themeData.textTheme.apply(fontFamily: "Barlow", bodyColor: Colors.black, displayColor: Colors.black38),
        primaryTextTheme: _themeData.primaryTextTheme
            .apply(fontFamily: "Barlow", bodyColor: Colors.black, displayColor: Colors.black38),
      ),
      routes: {
        StockListingPage.path: (_) => const StockListingPage(),
        StockDetailPage.path: (_) => const StockDetailPage(),
        StockValuePage.path: (_) => const StockValuePage(),
        StockIndicatorPage.path: (_) => const StockIndicatorPage(),
      },
    );
  }
}
