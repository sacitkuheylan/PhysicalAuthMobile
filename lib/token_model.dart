import 'dart:convert';

List<Token> postFromJson(String str) =>
    List<Token>.from(json.decode(str).map((x) => Token.fromMap(x)));

class Token {
  Token({
    required this.digitCount,
    required this.id,
    required this.name,
    required this.secretKey,
  });

  int id;
  String name;
  String secretKey;
  int digitCount;

  factory Token.fromMap(Map<String, dynamic> json) => Token(
    digitCount: json["digitCount"],
    id: json["id"],
    name: json["name"],
    secretKey: json["secretKey"],
  );
}
