import 'dart:convert';

List<StockResponse> stockResponseFromJson(String str) => List<StockResponse>.from(json.decode(str).map((x) => StockResponse.fromJson(x)));

String stockResponseToJson(List<StockResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StockResponse {
  StockResponse({
   this.id = 0,
    this.name = '',
    this.tag = '',
    this.color = '',
    this.criteria,
  });

  final int id;
  final String name;
  final String tag;
  final String color;
  final List<Criteria>? criteria;

  factory StockResponse.fromJson(Map<String, dynamic> json) => StockResponse(
    id: json['id'],
    name: json['name'],
    tag: json['tag'],
    color: json['color'],
    criteria: json['criteria'] == null ? null : List<Criteria>.from(json['criteria'].map((x) => Criteria.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    'id':  id,
    'name': name,
    'tag': tag,
    'color': color,
    'criteria': criteria == null ? null : List<dynamic>.from(criteria!.map((x) => x)),
  };
}

class Criteria {
  Criteria({
    this.type = '',
    this.text = '',
    this.variable
  });

  final String type;
  final String text;
  final Map<String, dynamic>? variable;

  factory Criteria.fromJson(Map<String, dynamic> json) => Criteria(
    type: json['type'],
    text: json['text'],
    variable: json['variable'] as Map<String, dynamic>?,
  );

  Map<String, dynamic> toJson() => {
    'type': type,
    'text': text,
    'variable': text,
  };
}

