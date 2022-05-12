import 'package:display_num_phone/domain/api_client/api_client.dart';
import 'package:display_num_phone/domain/entity/country.dart';
import 'package:flutter/material.dart';

class BottomSheetWidgetModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  var _countriess = <Country>[];
  List<Country> get countries => List.unmodifiable(_countriess);

  Future<List<Country>> loadCountries(List<Country> country) async {
    _countriess = await _apiClient.getCountries();
    country.addAll(_countriess);
    notifyListeners();
    return country;
  }
}


