import 'dart:convert';

class Cta {
  Cta({
    required this.text,
    this.bgColor,
    this.url,
    this.textColor,
  });

  String text;
  String? bgColor, url, textColor;

  factory Cta.fromJson(String str) => Cta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cta.fromMap(Map<String, dynamic> json) => Cta(
        text: json["text"],
        bgColor: json["bg_color"],
        url: json["url"],
        textColor: json["text_color"],
      );

  Map<String, dynamic> toMap() => {
        "text": text,
        "bg_color": bgColor,
        "url": url,
        "text_color": textColor,
      };
}
