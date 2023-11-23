import 'package:aviz/constants/custome_colors.dart';
import 'package:aviz/themes/text_style.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 32, bottom: 24),
      child: Row(
        children: [
          Icon(
            icon,
            color: CustomColors.baseColor,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: Style.grey700_16px_700w,
          )
        ],
      ),
    );
  }
}
