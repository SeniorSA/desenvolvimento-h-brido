import 'dart:convert';
import 'package:rn_flutter_sdk/models/_api_techy_model_.dart';
import 'package:http/http.dart' as http;

Future<TechyText> getRandomUser() async {
  const url = "https://techy-api.vercel.app/api/json";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return TechyText.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("ERRO! Não foi possível chamar a API!");
  }
}
