import 'package:flutter/material.dart';
import 'package:stock_app/presentation/utils/string_utils.dart';
import 'package:stock_app/presentation/widgets/rounded_button.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           const Text(
             StockAppString.somethingWentWrong,
            style:  TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 18,
              color: Colors.red,
            ),
          ),
          RoundedButton(
            name: StockAppString.tryAgain,
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
