import 'dart:convert';

import 'package:flutter/material.dart';

class CardImage {
  CardImage({
    required this.imageType,
    this.assetType,
    this.imageUrl,
  });

  String imageType;
  String? assetType, imageUrl;

  factory CardImage.fromJson(String str) => CardImage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CardImage.fromMap(Map<String, dynamic> json) => CardImage(
        imageType: json["image_type"] ?? '',
        assetType: json["asset_type"] ?? '',
        imageUrl: json["image_url"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "image_type": imageType,
        "asset_type": assetType,
        "image_url": imageUrl,
      };

  static Image toWidget(CardImage? cardImage) {
    if (cardImage?.imageType == 'ass' || cardImage?.imageType == 'asset') {
      return Image.asset(
        cardImage?.assetType ?? 'd',
        errorBuilder: (context, object, stackTrace) => Container(),
      );
    } else {
      return Image.network(
        cardImage?.imageUrl ?? 'c',
        errorBuilder: (context, object, stackTrace) => Container(),
      );
    }
  }

  static DecorationImage? toDecorationImage(
      CardImage? cardImage, double opacity) {
    if (cardImage == null ||
        cardImage.assetType == '' && cardImage.imageUrl == '') return null;
    if (cardImage.imageType == 'ass' || cardImage.imageType == 'asset') {
      return cardImage.assetType == null
          ? null
          : DecorationImage(
              opacity: opacity,
              image: AssetImage(cardImage.assetType ?? ''),
            );
    } else {
      return cardImage.assetType == null
          ? null
          : DecorationImage(
              fit: BoxFit.fitHeight,
              opacity: opacity,
              image: NetworkImage(cardImage.imageUrl ?? ''),
            );
    }
  }
}
