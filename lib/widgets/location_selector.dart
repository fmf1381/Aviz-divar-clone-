import 'package:aviz/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LocationSelector extends StatelessWidget {
  const LocationSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 144,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset(
                    'assets/images/maps.png',
                  ))),
        ),
        SizedBox(
          width: 186,
          child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Iconsax.location),
              label: const Text(
                'گرگان، صیاد شیرازی...',
                style: Style.white_16px_500w,
              )),
        )
      ],
    );
  }
}
