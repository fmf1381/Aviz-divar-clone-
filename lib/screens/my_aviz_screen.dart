import 'package:aviz/constants/custome_colors.dart';
import 'package:aviz/themes/text_style.dart';
import 'package:aviz/widgets/account_button.dart';
import 'package:aviz/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyAvizScreen extends StatelessWidget {
  const MyAvizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/aviz_logo.png'),
            const Text(
              'من',
              style: Style.baseColor_16px_500w,
            )
          ],
        ),
      ),
      body: _bodyMyAvizScreen(),
    );
  }

  Widget _bodyMyAvizScreen() {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 32,
                ),
                SearchBox(),
                SectionTitle(title: 'حساب کاربری', icon: Iconsax.profile_2user),
                AccountDetailsCard(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
                  child: Divider(
                    height: 2,
                    color: CustomColors.grey300,
                  ),
                ),
              ],
            ),
          ),
        ),
        AccountButtonList(),
        SliverToBoxAdapter(
          child: AppVersionView(),
        )
      ],
    );
  }
}

class AccountButtonList extends StatelessWidget {
  const AccountButtonList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final List<AccountBotton> listAccountBotton = [
      AccountBotton(text: 'آگهی های من', icon: Iconsax.note_2, onTap: () {}),
      AccountBotton(text: 'پرداخت های من', icon: Iconsax.card, onTap: () {}),
      AccountBotton(text: 'بازدید های اخیر', icon: Iconsax.eye, onTap: () {}),
      AccountBotton(text: 'ذخیره شده ها', icon: Iconsax.save_2, onTap: () {}),
      AccountBotton(text: 'تنظیمات', icon: Iconsax.setting, onTap: () {}),
      AccountBotton(
          text: 'پشتیبانی و قوانین',
          icon: Iconsax.message_question,
          onTap: () {}),
      AccountBotton(
          text: 'درباره آویز', icon: Iconsax.info_circle, onTap: () {}),
    ];
    return SliverList(
      delegate: SliverChildListDelegate(listAccountBotton),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: CustomColors.grey200),
          borderRadius: BorderRadius.circular(4)),
      child: const Row(
        children: [
          Icon(
            Iconsax.search_normal,
            color: CustomColors.grey400,
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  hintText: 'جستجو...',
                  hintStyle: Style.grey400_16px_400w,
                  border: InputBorder.none),
              style: Style.grey700_16px_400w,
            ),
          ),
        ],
      ),
    );
  }
}

class AccountDetailsCard extends StatelessWidget {
  const AccountDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: CustomColors.grey200)),
      child: Row(
        children: [
          SizedBox(
            width: 56,
            height: 56,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/ad_image1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      'سید محمد جواد هاشمی',
                      style: Style.grey700_14px_400w,
                    ),
                    Spacer(),
                    Icon(
                      Iconsax.edit,
                      color: CustomColors.baseColor,
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Text(
                      '۰۹۱۱۷۵۴۰۱۴۵',
                      style: Style.grey700_14px_400w,
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: CustomColors.baseColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'تایید شده',
                        style: Style.white_12px_500w,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppVersionView extends StatelessWidget {
  const AppVersionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Text(
            'نسخه',
            style: Style.grey400_14px_400w,
          ),
          Text(
            '1.5.9',
            style: Style.grey400_14px_400w,
          ),
        ],
      ),
    );
  }
}
