import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stock_app/data/model/stock_response.dart';
import 'package:stock_app/presentation/pages/stock_indicator/stock_indicator_page.dart';
import 'package:stock_app/presentation/pages/stock_value/stock_value_page.dart';
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
            child: criteria?.type == CriteriaType.plainText.type
                ? Text(
                    criteria?.text ?? '',
                    style: const TextStyle(fontSize: 16),
                  )
                : RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 16),
                      children: buildTextSpans(
                          criteria?.text ?? '', criteria?.variable, context),
                    ),
                  ),
          );
        },
      ),
    );
  }

  String getVariableText(String input, Map<String, dynamic> valueMap) {
    String result = input;
    if (valueMap.containsKey('type')) {
      if (valueMap['type'] == VariableType.value.name) {
        if (valueMap.containsKey('values') && valueMap['values'].isNotEmpty) {
          result =
              result.replaceAll(input, "(${valueMap['values'].elementAt(0)})");
        }
      } else {
        if (valueMap.containsKey('default_value')) {
          result = result.replaceAll(input, "(${valueMap['default_value']})");
        }
      }
    }

    return result;
  }

  List<String> splitStringWithPlaceholders(String text) {
    // Regular expression to match placeholders (e.g., $1, $2)
    RegExp placeholderRegex = RegExp(r'(\$[0-9]+)');

    // Use allMatches to iterate over matches and segments
    Iterable<RegExpMatch> matches = placeholderRegex.allMatches(text);

    // List to hold parts of the string
    List<String> parts = [];

    // Starting index of the next non-placeholder segment
    int startIndex = 0;

    // Iterate over matches and segments
    for (RegExpMatch match in matches) {
      // Get the segment of text before the current match
      String segment = text.substring(startIndex, match.start);

      // Add the segment to the parts list
      if (segment.isNotEmpty) {
        parts.add(segment);
      }

      // Add the matched placeholder to the parts list
      parts.add(match.group(0)!);

      // Update the starting index for the next segment
      startIndex = match.end;
    }

    // Add the final segment of text after the last match
    if (startIndex < text.length) {
      parts.add(text.substring(startIndex));
    }

    return parts;
  }

  List<TextSpan> buildTextSpans(
      String text, Map<String, dynamic>? variableValues, BuildContext context) {
    List<TextSpan> textSpans = [];

    List<String> parts = splitStringWithPlaceholders(text);

    for (var part in parts) {
      if (part.startsWith('\$')) {
        if (variableValues?.containsKey(part) == true) {
          //Placeholder text part
          textSpans.add(
            TextSpan(
              text: getVariableText(part, variableValues![part]),
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (variableValues[part]['type'] == VariableType.value.name) {
                    Navigator.of(context).pushNamed(StockValuePage.path,
                        arguments: variableValues[part]);
                  } else {
                    Navigator.of(context).pushNamed(StockIndicatorPage.path,
                        arguments: variableValues[part]);
                  }
                },
            ),
          );
        }
      } else {
        // Regular text part
        textSpans.add(
          TextSpan(
            text: part,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        );
      }
    }

    return textSpans;
  }
}
