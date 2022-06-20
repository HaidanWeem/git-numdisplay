import 'package:display_num_phone/domain/api_client/api_client.dart';
import 'package:display_num_phone/domain/entity/country.dart';
import 'package:flutter/material.dart';

import '../../../model/flag_code.dart';

class BottomSheetWidgetModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  List<Country> _countries = <Country>[];
  // List<Country> get countries => List.unmodifiable(_countries);

  var _filteredCountries = <Country>[];
  List<Country> get filteredCountries => _filteredCountries;

  final searchController = TextEditingController();

  BottomSheetWidgetModel() {
    searchCountries();
  }

  void selectCountry(BuildContext context,FlagBack flagCodeBox) {
    Navigator.pop(context, flagCodeBox);
  }

  Future<void> searchCountries() async {
     _countries = await _apiClient.getCountries();  
    if (searchController.text.isNotEmpty) {
      _filteredCountries = _countries.where((Country country) {
        return country.name.common!
            .toLowerCase()
            .contains(searchController.text.toLowerCase());
      }).toList();
    } else {
      _filteredCountries = _countries;
    }
    notifyListeners();
  }
}
