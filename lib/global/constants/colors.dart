import 'package:flutter/material.dart';

const logoColor = Color(0xFF4C5454);
const homeBackgroundColor = Color(0xFFF7F6F3);

Color stringToColor(String hex) {
  return Color(int.parse('0xFF' + hex.substring(1)));
}
