import 'package:aviz/constants/custome_colors.dart';
import 'package:aviz/themes/text_style.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  CategoryButton({super.key, this.text = '', this.onTap});
  final String text;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
              Text(
                text,
                style: Style.grey700_16px_400w,
              ),
              const Spacer(),
              Image.asset('assets/images/arrow_left_red.png')
            ],
          ),
        ),
      ),
    );
  }
}
