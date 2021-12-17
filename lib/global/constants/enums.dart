// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class DesignTypeEnum {
  static const hc1 = "HC1";
  static const hc3 = "HC3";
  static const hc5 = "HC5";
  static const hc6 = "HC6";
  static const hc9 = "HC9";

  static Widget toWidget(String designType) {
    switch (designType) {
      case hc1:
        return Container();
      case hc3:
        return Container();
      case hc5:
        return Container();
      case hc6:
        return Container();
      case hc9:
        return Container();
      default:
        return Container();
    }
  }
}

class FontStyleEnum {
  static const underline = 'underline';
  static const italic = 'italic';
  static const bold = 'bold';
  static const strikethrough = 'strikethrough';

  static TextStyle toFontStyle(String f) {
    switch (f) {
      case underline:
        return const TextStyle(decoration: TextDecoration.underline);
      case italic:
        return const TextStyle(fontStyle: FontStyle.italic);
      case bold:
        return const TextStyle(decoration: TextDecoration.underline);
      case strikethrough:
        return const TextStyle(decoration: TextDecoration.underline);
      default:
        return const TextStyle();
    }
  }
}

class ImageTypeEnum {
  static const assetType = 'asset';
  static const externalType = 'external';
}
