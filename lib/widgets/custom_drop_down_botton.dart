
import 'package:aviz/constants/custome_colors.dart';
import 'package:aviz/themes/text_style.dart';
import 'package:flutter/material.dart';

List<String> list = <String>['فروش آپارتمان', 'فروش خانه و ویلا'];

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String selectedOptions = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: CustomColors.grey200),
          borderRadius: BorderRadius.circular(4)),
      child: DropdownButton<String>(
        value: selectedOptions,
        icon: Image.asset('assets/images/arrow_down.png'),
        style: Style.grey700_16px_400w,
        borderRadius: BorderRadius.circular(4),
        elevation: 2,
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedOptions = newValue!;
          });
        },
      ),
    );
  }
}
