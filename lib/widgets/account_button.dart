// ignore_for_file: must_be_immutable

import 'package:aviz/constants/custome_colors.dart';
import 'package:aviz/themes/text_style.dart';
import 'package:flutter/material.dart';

class AccountBotton extends StatelessWidget {
  AccountBotton({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });
  final String text;
  final IconData icon;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
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
                Icon(
                  icon,
                  color: CustomColors.baseColor,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  text,
                  style: Style.grey700_16px_500w,
                ),
                const Spacer(),
                Image.asset('assets/images/arrow_left_grey.png')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
