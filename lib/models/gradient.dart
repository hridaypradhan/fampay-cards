import 'dart:convert';

class Gradient {
    Gradient({
        required this.colors,
        required this.angle,
    });

    List<String> colors;
    int angle;

    factory Gradient.fromJson(String str) => Gradient.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Gradient.fromMap(Map<String, dynamic> json) => Gradient(
        colors: List<String>.from(json["colors"].map((x) => x)),
        angle: json["angle"],
    );

    Map<String, dynamic> toMap() => {
        "colors": List<dynamic>.from(colors.map((x) => x)),
        "angle": angle,
    };
}