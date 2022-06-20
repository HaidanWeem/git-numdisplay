import 'package:display_num_phone/theme/theme_display.dart';
import 'package:display_num_phone/widgets/main_display/display_number_phone/main_display_model.dart';
import 'package:display_num_phone/widgets/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 200,
                    ),
                    child: Row(
                      children: [
                        ChooseCountryButton(),
                        TextFieldWidget(),
                      ],
                    ),
                  ),
                ],
              ),
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
      child: Text(
        'Get Started',
        style: TextStyle(
          fontSize: 28,
          fontFamily: 'ArialBold',
          color: Colors.white,
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<TextFieldButtonModel>(context);
    if (model == null) return const Text('Error');
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 20),
        child: TextField(
          controller: model.phoneNumberController,
          inputFormatters: [model.maskFormatter],
          decoration: decorationTextField,
          keyboardType: TextInputType.phone,
          onChanged: (value) {
            model.lightSwitchButton(value);
          },
        ),
      ),
    );
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
  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TextFieldButtonModel>(context);
    if (model == null) return const Text('Error');
    return SizedBox.fromSize(
      size: const Size(80, 45),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Material(
          color: backgroundColorButtonsTxtFields,
          child: InkWell(
            splashColor: Colors.grey,
            onTap: () => model.chooseCountry(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SizedBox(
                    width: 25,
                    height: 15,
                    child: SvgPicture.network(
                      model.flagCodeBox.flag,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  model.flagCodeBox.code,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NextButton extends StatefulWidget {
  NextButton({Key? key}) : super(key: key);

  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TextFieldButtonModel>(context);
    if (model == null) return const Text('Error');
    final color = (model.switcher == false)
        ? backgroundColorButtonsTxtFields
        : Colors.white;
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20,
        bottom: 20.0,
        top: 90,
      ),
      child: SizedBox.fromSize(
        size: const Size(45, 45),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Material(
            color: color,
            child: InkWell(
              splashColor: Colors.grey,
              onTap: model.onTapButtonNext,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.blueGrey,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
