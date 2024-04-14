import 'package:flutter/material.dart';

enum TagColorNames {
  red(Colors.red),
  green(Colors.green);

  final Color color;

  const TagColorNames(this.color);

  static TagColorNames fromColorName(String name){
    switch(name){
      case 'red':
        return red;
      case 'green':
        return green;
      default:
        return green;
    }
  }
}
