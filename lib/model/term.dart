import 'dart:convert';
import 'package:flutter/material.dart';

class ChessTerm {
  int id;
  String term;
  String definition;

  ChessTerm({
    @required this.id,
    @required this.term,
    @required this.definition,
  });

  factory ChessTerm.fromRawJson(String str) =>
      ChessTerm.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChessTerm.fromJson(Map<String, dynamic> json) => ChessTerm(
        id: json["id"],
        term: json["term"],
        definition: json["definition"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "term": term,
        "definition": definition,
      };
}
