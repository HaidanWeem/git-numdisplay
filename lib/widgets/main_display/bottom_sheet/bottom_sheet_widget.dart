import 'package:display_num_phone/domain/entity/country.dart';
import 'package:display_num_phone/theme/theme_bottom_sheet.dart';
import 'package:display_num_phone/theme/theme_display.dart';
import 'package:display_num_phone/widgets/main_display/bottom_sheet/bottom_sheet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseCountryW extends StatelessWidget {
  const ChooseCountryW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CountryCodeWidget(),
          Expanded(child: ListCountryW()),
        ],
      ),
    );
  }
}

class CountryCodeWidget extends StatelessWidget {
  const CountryCodeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 20),
      child: Row(
        children: [
          const Expanded(
            child: Text('Country code',
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'ArialBold',
                    color: Colors.white)),
          ),
          const ButtonClose()
        ],
      ),
    );
  }
}

class ButtonClose extends StatelessWidget {
  const ButtonClose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20),
      child: SizedBox.fromSize(
        size: const Size(18, 18),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Material(
                color: backgroundColorButtonsTxtFields,
                child: InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.close, size: 16),
                      ],
                    )))),
      ),
    );
  }
}

class ListCountryW extends StatefulWidget {
  ListCountryW({Key? key}) : super(key: key);

  @override
  State<ListCountryW> createState() => _ListCountryWState();
}

class _ListCountryWState extends State<ListCountryW> {
  final listModel = BottomSheetWidgetModel();
  List<Country> country = [];
  var _filteredCountries = <Country>[];
  final _searchController = TextEditingController();

  void addCountries() async {
    country = await listModel.loadCountries(country);
    setState(() {});
  }

  void _searchCountries() {
    if (_searchController.text.isNotEmpty) {
      _filteredCountries = country.where((Country country) {
        return country.name.common!
            .toLowerCase()
            .contains(_searchController.text.toLowerCase());
      }).toList();
    } else {
      _filteredCountries = country;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    addCountries();
    _filteredCountries = country;
    _searchController.addListener(_searchCountries);
  }

  void selectCountry(String flagCode) {
    Navigator.pop(context, flagCode);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _filteredCountries.length,
            itemExtent: 50,
            itemBuilder: (BuildContext context, int index) {
              final oneCountry = _filteredCountries[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, top: 14),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            oneCountry.flags?.svg != null
                                ? SizedBox(
                                    width: 25,
                                    height: 15,
                                    child: SvgPicture.network(
                                      oneCountry.flags!.svg,
                                      fit: BoxFit.fill,
                                      placeholderBuilder:
                                          (BuildContext context) => Container(
                                        padding: const EdgeInsets.all(5),
                                        child:
                                            const CircularProgressIndicator(),
                                      ),
                                      matchTextDirection: false,
                                    ),
                                  )
                                : const Text('fl'),
                            const SizedBox(width: 10),
                            oneCountry.idd?.suffixes?[0] != null
                                ? Text(
                                    (oneCountry.idd!.root).toString() +
                                        (oneCountry.idd!.suffixes![0])
                                            .toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis)
                                : const Text('+???'),
                            const SizedBox(width: 10),
                            oneCountry.name.common != null
                                ? Text(
                                    oneCountry.name.common.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                : const Text('null'),
                          ],
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            final flagcode = oneCountry.flags!.svg +
                                '_' +
                                (oneCountry.idd!.root).toString() +
                                (oneCountry.idd!.suffixes![0]).toString();
                            print(flagcode);
                            selectCountry(flagcode);
                          }),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 20.0,
            bottom: 5.0,
          ),
          child: TextField(
            decoration: textFieldTheme,
            controller: _searchController,
          ),
        ),
      ],
    );
  }
}
