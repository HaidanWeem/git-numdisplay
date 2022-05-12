import 'package:display_num_phone/domain/api_client/api_client.dart';
import 'package:display_num_phone/theme/theme_display.dart';
import 'package:display_num_phone/widgets/main_display/display_number_phone/main_display_model.dart';
import 'package:display_num_phone/widgets/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MainDisplayWidget extends StatefulWidget {
  MainDisplayWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MainDisplayWidget> createState() => _MainDisplayWidgetState();
}

class _MainDisplayWidgetState extends State<MainDisplayWidget> {
  final _model = TextFieldButtonModel();

  @override
  Widget build(BuildContext context) {
    ApiClient().getCountries();
    return Scaffold(
      body: SingleChildScrollView(
        child: NotifierProvider(
          model: _model,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextGetStartedW(),
                  const SizedBox(height: 200),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [ChooseCountryButton(), TextFieldWidget()],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70),
              NextButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextGetStartedW extends StatelessWidget {
  const TextGetStartedW({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20, top: 100),
      child: Text('Get Started',
          style: TextStyle(
              fontSize: 28, fontFamily: 'ArialBold', color: Colors.white)),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final maskFormatter = MaskTextInputFormatter(mask: '(###) ###-####');
  final TextEditingController phoneNumberController = TextEditingController();
  TextFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(left: 8, right: 20),
      child: TextField(
          controller: phoneNumberController,
          inputFormatters: [maskFormatter],
          decoration: decorationTextField,
          keyboardType: TextInputType.phone,
          onChanged: (value) {
            NotifierProvider.read<TextFieldButtonModel>(context)!
                .lightSwitchButton(value);
          }),
    ));
  }
}

class ChooseCountryButton extends StatefulWidget {
  ChooseCountryButton({
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseCountryButton> createState() => _ChooseCountryButtonState();
}

class _ChooseCountryButtonState extends State<ChooseCountryButton> {
  String flagCode = 'https://flagcdn.com/ua.svg_+380';
  String Code = ' ';
  String Flag = ' ';

  void _chooseCountry(BuildContext context) async {
    //  Navigator.of(context).pushReplacementNamed('/bottom_sheet');
    final flagCode = await Navigator.pushNamed(context, '/bottom_sheet');
    this.flagCode = flagCode.toString();
    divideString(this.flagCode);
    setState(() {});
  }

  void divideString(String? codeFlag) {
    if (codeFlag != null) {
      var codeFlags = codeFlag.split('_');
      Code = codeFlags[1];
      Flag = codeFlags[0];
    }
  }

  @override
  void initState() {
    super.initState();
    divideString(flagCode);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // divideString(flagCode);
    return SizedBox.fromSize(
      size: const Size(80, 45),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Material(
              color: backgroundColorButtonsTxtFields,
              child: InkWell(
                  splashColor: Colors.grey,
                  onTap: () => _chooseCountry(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SizedBox(
                          width: 25,
                          height: 15,
                          child: SvgPicture.network(
                            Flag,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text(
                        Code,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )))),
    );
  }
}

class NextButton extends StatefulWidget {
  NextButton({Key? key}) : super(key: key);

  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  bool _switcher = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final model = NotifierProvider.watch<TextFieldButtonModel>(context);
    model?.addListener(() {
      _switcher = model.switcher;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox.fromSize(
        size: const Size(45, 45),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Material(
                color: (_switcher == false)
                    ? backgroundColorButtonsTxtFields
                    : Colors.white,
                child: InkWell(
                    splashColor: Colors.grey,
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.arrow_forward_rounded,
                            color: Colors.blueGrey, size: 30),
                      ],
                    )))),
      ),
    );
  }
}
