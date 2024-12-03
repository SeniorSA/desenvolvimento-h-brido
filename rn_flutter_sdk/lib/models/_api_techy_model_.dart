// To parse this JSON data, do
//
//     final techyText = techyTextFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

TechyText techyTextFromJson(String str) => TechyText.fromJson(json.decode(str));

String techyTextToJson(TechyText data) => json.encode(data.toJson());

class TechyText {
  final String message;

  TechyText({
    required this.message,
  });

  TechyText copyWith({
    String? message,
  }) =>
      TechyText(
        message: message ?? this.message,
      );

  factory TechyText.fromJson(Map<String, dynamic> json) => TechyText(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
