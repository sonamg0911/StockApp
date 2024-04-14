import 'package:flutter/material.dart';
import 'package:stock_app/presentation/pages/stock_details/stock_details_page.dart';
import 'package:stock_app/presentation/pages/stock_listing/stock_list_state.dart';
import 'package:stock_app/presentation/pages/stock_listing/stock_listing_provider.dart';
import 'package:stock_app/presentation/pages/stock_listing/widgets/stock_list_items.dart';
import 'package:stock_app/presentation/utils/string_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_app/presentation/widgets/custom_error_widget.dart';

class StockListingPage extends ConsumerStatefulWidget {
  static const path = "/";

  const StockListingPage({super.key});

  @override
  StockListingPageState createState() => StockListingPageState();
}

class StockListingPageState extends ConsumerState<StockListingPage> {
  final apiProvider = StateNotifierProvider<StockListingProvider,StockListState>((_) {
    return StockListingProvider();
  });

  @override
  void initState() {
    ref.read(apiProvider.notifier).getStocks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StockListState state = ref.watch(apiProvider);

    return Scaffold(
        appBar: AppBar(
          titleSpacing: 10,
          title: const Text(StockAppString.stocks,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
        ),
        body: Builder(builder: (BuildContext context) {
          if (state is StockListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is StockListLoaded) {
            return ListView.builder(
              itemCount: state.list?.length,
              itemBuilder: (context, itemNumber) {
                final stock = state.list?.elementAt(itemNumber);
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(StockDetailPage.path, arguments: stock);
                  },
                  child: StockListItem(
                    stock: stock,
                  ),
                );
              },
            );
          } else if (state is StockListError) {
            return CustomErrorWidget(
              onPressed: () {
                ref.read(apiProvider.notifier).getStocks();
              },
            );
          } else {
            return CustomErrorWidget(
              onPressed: () {
                ref.read(apiProvider.notifier).getStocks();
              },
            );
          }
        }));
  }
}
