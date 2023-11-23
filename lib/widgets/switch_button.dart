import 'package:aviz/constants/custome_colors.dart';
import 'package:aviz/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key, this.text = ''});
  final String text;

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _value = !_value;
        });
      },
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: CustomColors.grey300),
            borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                widget.text,
                style: Style.grey700_16px_400w,
              ),
              const Spacer(),
              FlutterSwitch(
                value: _value,
                toggleColor: CustomColors.grey200,
                activeColor: CustomColors.baseColor,
                inactiveColor: CustomColors.grey400,
                width: 20.0,
                height: 16.0,
                activeText: '',
                inactiveText: '',
                valueFontSize: 8.0,
                toggleSize: 8.0,
                duration: const Duration(microseconds: 100),
                borderRadius: 30.0,
                padding: 4,
                showOnOff: true,
                onToggle: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
