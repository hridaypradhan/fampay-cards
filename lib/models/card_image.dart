import 'dart:convert';

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
        imageType: json["image_type"],
        assetType: json["asset_type"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toMap() => {
        "image_type": imageType,
        "asset_type": assetType,
        "image_url": imageUrl,
      };
}
