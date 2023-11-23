import 'package:aviz/constants/custome_colors.dart';
import 'package:aviz/themes/text_style.dart';
import 'package:aviz/widgets/category_button.dart';
import 'package:aviz/widgets/location_selector.dart';
import 'package:aviz/widgets/section_title.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AdDetailsScreen extends StatelessWidget {
  const AdDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset('assets/images/arrow_right.png')),
        actions: [
          Image.asset('assets/images/information.png'),
          Image.asset('assets/images/share.png'),
          Image.asset('assets/images/archive.png')
        ],
      ),
      body: _getBody(),
    );
  }

  DefaultTabController _getBody() {
    return DefaultTabController(
      length: 4,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 160,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 32),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset('assets/images/ad_image1.png'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              color: CustomColors.grey100,
                              child: const Text(
                                'آپارتمان',
                                style: Style.baseColor_14px_400w,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              '۱۶ دقیقه پیش در گرگان',
                              style: Style.grey500_14px_400w,
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 24, left: 16, right: 16, bottom: 64),
                        child: Text(
                          'آپارتمان ۵۰۰ متری در صیاد شیرازی',
                          style: Style.grey700_16px_700w,
                        ),
                      ),
                      CategoryButton(text: 'هشدار های قبل از معامله!'),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: ButtonsTabBar(
                      borderWidth: 1,
                      duration: 200,
                      physics: const ScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      buttonMargin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 7),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      unselectedBorderColor: CustomColors.grey200,
                      borderColor: Colors.transparent,
                      backgroundColor: CustomColors.baseColor,
                      unselectedBackgroundColor: Colors.white,
                      unselectedLabelStyle: Style.baseColor_14px_400w,
                      labelStyle: Style.white_14px_400w,
                      radius: 4,
                      tabs: const [
                        Tab(
                          text: 'مشخصات',
                        ),
                        Tab(
                          text: 'قیمت',
                        ),
                        Tab(
                          text: 'ویژگی ها و امکانات',
                        ),
                        Tab(
                          text: 'توضیحات',
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: const TabBarView(
              children: <Widget>[
                SpecificationsTabView(),
                PriceTabView(),
                AttributesTabView(),
                DescriptionTabView(),
              ],
            ),
          ),
          const CallChatButtons()
        ],
      ),
    );
  }
}

class DescriptionTabView extends StatelessWidget {
  const DescriptionTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 26, left: 16, right: 16),
      child: Text(
        'ویلا ۵۰۰ متری در خیابان صیاد شیرازی ویو عالی وسط جنگل قیمت فوق العاده  گذاشتم فروش فوری  خریدار باشی تخفیف پای معامله میدم.',
        style: Style.grey500_14px_400w,
      ),
    );
  }
}

class AttributesTabView extends StatelessWidget {
  const AttributesTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int itemCountAttributesList = 2;
    int itemCountPossibilitiesList = 7;

    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SectionTitle(title: 'ویژگی ها', icon: Iconsax.clipboard),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(right: 16, left: 16),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: CustomColors.grey200),
                borderRadius: BorderRadius.circular(4)),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: itemCountAttributesList,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: ((context, value) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: [
                            Text(
                              'سند',
                              style: Style.grey500_16px_400w,
                            ),
                            Spacer(),
                            Text(
                              'تک برگ',
                              style: Style.grey500_16px_400w,
                            )
                          ],
                        ),
                      ),
                      if (value != itemCountAttributesList - 1)
                        DottedBorder(
                          padding: EdgeInsets.zero,
                          color: CustomColors.grey300,
                          strokeWidth: 1,
                          dashPattern: const [3, 8],
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SectionTitle(title: 'امکانات', icon: Iconsax.magicpen),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(right: 16, left: 16),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: CustomColors.grey200),
                borderRadius: BorderRadius.circular(4)),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: itemCountPossibilitiesList,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: ((context, value) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: [
                            Text(
                              'پارکینگ',
                              style: Style.grey500_16px_400w,
                            ),
                          ],
                        ),
                      ),
                      if (value != itemCountPossibilitiesList - 1)
                        DottedBorder(
                          padding: EdgeInsets.zero,
                          color: CustomColors.grey300,
                          strokeWidth: 1,
                          dashPattern: const [3, 8],
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ),
          ),
        )
      ],
    );
  }
}

class PriceTabView extends StatelessWidget {
  const PriceTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int itemCountList = 2;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(top: 32, right: 16, left: 16),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: CustomColors.grey200),
                borderRadius: BorderRadius.circular(4)),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: itemCountList,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: ((context, value) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: [
                            Text(
                              'قیمت هر متر:',
                              style: Style.grey700_16px_400w,
                            ),
                            Spacer(),
                            Text(
                              '۴۶٬۴۶۰٬۰۰۰',
                              style: Style.grey700_16px_400w,
                            )
                          ],
                        ),
                      ),
                      if (value != itemCountList - 1)
                        DottedBorder(
                          padding: EdgeInsets.zero,
                          color: CustomColors.grey300,
                          strokeWidth: 1,
                          dashPattern: const [3, 8],
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}

class SpecificationsTabView extends StatelessWidget {
  const SpecificationsTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                height: 98,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 32, right: 16, left: 16),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: CustomColors.grey200),
                    borderRadius: BorderRadius.circular(4)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'متراژ',
                            style: Style.grey500_14px_400w,
                          ),
                          SizedBox(height: 8),
                          Text(
                            '۵۰۰',
                            style: Style.grey700_14px_400w,
                          ),
                        ],
                      ),
                      DottedBorder(
                          padding: EdgeInsets.zero,
                          color: CustomColors.grey300,
                          strokeWidth: 1,
                          dashPattern: const [3, 8],
                          child: Container(height: 48)),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'اتاق',
                            style: Style.grey500_14px_400w,
                          ),
                          SizedBox(height: 8),
                          Text(
                            '۶',
                            style: Style.grey700_14px_400w,
                          ),
                        ],
                      ),
                      DottedBorder(
                          padding: EdgeInsets.zero,
                          color: CustomColors.grey300,
                          strokeWidth: 1,
                          dashPattern: const [3, 8],
                          child: Container(height: 48)),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'طبقه',
                            style: Style.grey500_14px_400w,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'دوبلکس',
                            style: Style.grey700_14px_400w,
                          ),
                        ],
                      ),
                      DottedBorder(
                          padding: EdgeInsets.zero,
                          color: CustomColors.grey300,
                          strokeWidth: 1,
                          dashPattern: const [3, 8],
                          child: Container(height: 48)),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ساخت',
                            style: Style.grey500_14px_400w,
                          ),
                          SizedBox(height: 8),
                          Text(
                            '۱۴۰۲',
                            style: Style.grey700_14px_400w,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SectionTitle(title: 'موقعیت مکانی', icon: Iconsax.map),
              const LocationSelector(),
            ],
          ),
        ),
      ],
    );
  }
}

class CallChatButtons extends StatelessWidget {
  const CallChatButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 24),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Iconsax.message),
                label: const Text(
                  'گفتگو',
                  style: Style.white_16px_500w,
                )),
          ),
          const SizedBox(width: 26),
          Expanded(
            child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Iconsax.call),
                label: const Text(
                  'اطلاعات تماس',
                  style: Style.white_16px_500w,
                )),
          ),
        ],
      ),
    );
  }
}
