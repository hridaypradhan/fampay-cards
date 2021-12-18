import 'dart:convert';

import 'package:fampay_cards/global/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class FampayGradient {
  FampayGradient({
    required this.colors,
    required this.angle,
  });

  List<String> colors;
  double? angle;

  factory FampayGradient.fromJson(String str) =>
      FampayGradient.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FampayGradient.fromMap(Map<String, dynamic> json) => FampayGradient(
        colors: List<String>.from(json["colors"] ?? [].map((x) => x)),
        angle: json["angle"],
      );

  Map<String, dynamic> toMap() => {
        "colors": List<dynamic>.from(colors.map((x) => x)),
        "angle": angle,
      };

  static Gradient toWidget(FampayGradient? gradient) {
    return LinearGradient(
      colors: List.generate(
        gradient!.colors.length,
        (index) => stringToColor(gradient.colors[index]),
      ),
      transform: GradientRotation(gradient.angle ?? 0),
    );
  }
}
