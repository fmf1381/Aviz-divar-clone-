import 'package:aviz/constants/custome_colors.dart';
import 'package:aviz/themes/text_style.dart';
import 'package:aviz/widgets/custom_textfield.dart';
import 'package:aviz/widgets/section_title.dart';
import 'package:aviz/widgets/switch_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ImageTitleAdsSelectView extends StatelessWidget {
  const ImageTitleAdsSelectView({super.key, this.pageController});
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SectionTitle(
            title: 'تصویر آویز',
            icon: Iconsax.camera,
          ),
          const AdsImagesSelectSection(),
          const SectionTitle(title: 'عنوان بخش', icon: Iconsax.edit_2),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(hintText: 'عنوان آویز را وارد کنید'),
          ),
          const SectionTitle(title: 'توضیحات', icon: Iconsax.clipboard_text),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 90,
              child: CustomTextField(
                hintText: 'عنوان آویز را وارد کنید',
                maxLines: 3,
              ),
            ),
          ),
          const SizedBox(height: 32),
          const SwitchButton(text: 'فعال کردن گفتگو'),
          const SizedBox(height: 16),
          const SwitchButton(text: 'فعال کردن تماس'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'ثبت آگهی',
                  style: Style.white_16px_500w,
                )),
          )
        ],
      ),
    );
  }
}

class AdsImagesSelectSection extends StatelessWidget {
  const AdsImagesSelectSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DottedBorder(
        padding: EdgeInsets.zero,
        color: CustomColors.grey400,
        strokeWidth: 1,
        dashPattern: const [6, 5],
        radius: const Radius.circular(4),
        child: Container(
          height: 160,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'لطفا تصویر آویز خود را بارگذاری کنید',
                  style: Style.grey500_14px_400w,
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 40)),
                    icon: const Icon(
                      Iconsax.document_upload,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'انتخاب تصویر',
                      style: Style.white_16px_500w,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
