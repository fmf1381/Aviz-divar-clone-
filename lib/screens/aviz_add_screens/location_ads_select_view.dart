import 'package:aviz/themes/text_style.dart';
import 'package:aviz/widgets/location_selector.dart';
import 'package:aviz/widgets/section_title.dart';
import 'package:aviz/widgets/switch_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LocationAdsSelectView extends StatelessWidget {
  const LocationAdsSelectView({super.key, this.pageController});
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        const SectionTitle(title: 'موقعیت مکانی', icon: Iconsax.map),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'بعد انتخاب محل دقیق روی نقشه میتوانید نمایش آن را فعال یا غیر فعال کید تا حریم خصوصی شما خفظ شود.',
            style: Style.grey500_14px_400w,
          ),
        ),
        const SizedBox(height: 32),
        const LocationSelector(),
        const SizedBox(height: 40),
        const SwitchButton(text: 'موقعیت دقیق نقشه نمایش داده شود؟'),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, bottom: 32),
          child: ElevatedButton(
              onPressed: () {
                pageController!.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              child: const Text(
                'بعدی',
                style: Style.white_16px_500w,
              )),
        )
      ]),
    );
  }
}
