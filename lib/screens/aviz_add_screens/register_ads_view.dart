import 'package:aviz/constants/custome_colors.dart';
import 'package:aviz/themes/text_style.dart';
import 'package:aviz/widgets/custom_drop_down_botton.dart';
import 'package:aviz/widgets/custom_textfield.dart';
import 'package:aviz/widgets/custom_textfield_properties.dart';
import 'package:aviz/widgets/section_title.dart';
import 'package:aviz/widgets/switch_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
final now = DateTime.now();
class RegisterAdsView extends StatefulWidget {
  const RegisterAdsView({super.key, this.pageController});
  final PageController? pageController;

  @override
  State<RegisterAdsView> createState() => _RegisterAdsViewState();
}

class _RegisterAdsViewState extends State<RegisterAdsView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SectionTitle(
            title: 'انتخاب دسته بندی آویز',
            icon: Iconsax.category_2,
          ),
        ),
        const SliverToBoxAdapter(
          child: CategoryLocationSelectSection(),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(right: 16, left: 16, top: 32),
            child: Divider(
              height: 2,
              color: CustomColors.grey200,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SectionTitle(title: 'ویژگی ها', icon: Iconsax.clipboard),
        ),
        const SliverToBoxAdapter(
          child: AttributesSection(),
        ),
        const SliverToBoxAdapter(
          child: SectionTitle(title: 'امکانات', icon: Iconsax.magicpen),
        ),
        const PossibilitiesList(),
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.only(right: 16, left: 16, top: 32, bottom: 32),
            child: ElevatedButton(
                onPressed: () {
                  widget.pageController!.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                child: const Text(
                  'بعدی',
                  style: Style.white_16px_500w,
                )),
          ),
        )
      ],
    );
  }
}

class CategoryLocationSelectSection extends StatelessWidget {
  const CategoryLocationSelectSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'دسته بندی',
                style: Style.grey500_14px_400w,
              ),
              SizedBox(height: 16),
              CustomDropdownButton(),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'محدوده ملک',
                style: Style.grey500_14px_400w,
              ),
              SizedBox(height: 16),
              SizedBox(width: 160, child: CustomTextField(hintText: 'محدوده')),
            ],
          ),
        ],
      ),
    );
  }
}

class AttributesSection extends StatelessWidget {
  const AttributesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'متراژ',
                style: Style.grey500_14px_400w,
              ),
              const SizedBox(height: 16),
              CustomTextFieldProperties(
                defaultlValue: 100,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 24),
              const Text(
                'طبقه',
                style: Style.grey500_14px_400w,
              ),
              const SizedBox(height: 16),
              CustomTextFieldProperties(
                defaultlValue: 2,
                controller: TextEditingController(),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'تعداد اتاق',
                style: Style.grey500_14px_400w,
              ),
              const SizedBox(height: 16),
              CustomTextFieldProperties(
                defaultlValue: 1,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 24),
              const Text(
                'سال ساخت',
                style: Style.grey500_14px_400w,
              ),
              const SizedBox(height: 16),
              CustomTextFieldProperties(
                defaultlValue: 1402,
                controller: TextEditingController(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PossibilitiesList extends StatelessWidget {
  const PossibilitiesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: 3,
        itemBuilder: ((context, value) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: SwitchButton(
              text: 'آسانسور',
            ),
          );
        }));
  }
}
