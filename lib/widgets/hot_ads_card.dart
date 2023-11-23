import 'package:aviz/constants/custome_colors.dart';
import 'package:aviz/themes/text_style.dart';
import 'package:flutter/material.dart';

class HotAdsCard extends StatelessWidget {
  const HotAdsCard(
      {super.key,
      required this.image,
      required this.title,
      required this.caption,
      required this.price,
      this.onTap});
  final Widget image;
  final String title;
  final String caption;
  final String price;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 268,
        width: 224,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  spreadRadius: 0,
                  blurRadius: 24,
                  offset: Offset(0, 18))
            ],
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: _getContent(),
      ),
    );
  }

  Column _getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 192,
          height: 112,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: image,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          style: Style.grey700_14px_700w,
        ),
        const SizedBox(height: 8),
        Text(
          caption,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          style: Style.grey500_12px_400w,
        ),
        const Spacer(),
        Row(
          children: [
            const Text(
              'قیمت:',
              style: Style.grey700_12px_500w,
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                  color: CustomColors.grey200,
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                price,
                style: Style.baseColor_12px_500w,
              ),
            )
          ],
        )
      ],
    );
  }
}
