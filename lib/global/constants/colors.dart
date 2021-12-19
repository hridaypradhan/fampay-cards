import 'package:flutter/material.dart';

const primaryColor = Color(0xFF4C5454);
const homeBackgroundColor = Color(0xFFF7F6F3);
const hc3IconColor = Color(0xFFFBAF03);

Color stringToColor(String? hex) {
  if (hex == null) return Colors.amber;
  return Color(int.parse('0xFF' + hex.substring(1)));
}
