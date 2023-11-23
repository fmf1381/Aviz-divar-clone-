import 'package:aviz/constants/custome_colors.dart';
import 'package:aviz/themes/text_style.dart';
import 'package:flutter/material.dart';

class RecentAdsCard extends StatelessWidget {
  const RecentAdsCard(
      {super.key,
      required this.image,
      required this.title,
      required this.caption,
      required this.price,
      this.onTap});
  final Image image;
  final String title;
  final String caption;
  final String price;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 140,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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

  Row _getContent() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          height: 110,
          width: 110,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: image,
          ),
        ),
      ],
    );
  }
}
