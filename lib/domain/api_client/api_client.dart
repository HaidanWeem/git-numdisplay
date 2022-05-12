import 'dart:convert';
import 'dart:io';

import 'package:display_num_phone/domain/entity/country.dart';

class ApiClient {
  final client = HttpClient();
  Future<List<Country>> getCountries() async {
    final json =
        await get('https://restcountries.com/v3.1/all') as List<dynamic>;
    final countries = json
        .map((dynamic e) => Country.fromJson(e as Map<String, dynamic>))
        .toList();
    return countries;
  }

  Future<dynamic> get(String uri) async {
    final url = Uri.parse(uri);
    final request = await client.getUrl(url);
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();

    final dynamic json = jsonDecode(jsonString);

    return json;
  }
}
