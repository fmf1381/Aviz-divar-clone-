import 'package:aviz/screens/ad_details_screen.dart';
import 'package:aviz/themes/text_style.dart';
import 'package:aviz/widgets/hot_ads_card.dart';
import 'package:aviz/widgets/recent_ads_crad.dart';
import 'package:flutter/material.dart';

class AdsScreen extends StatelessWidget {
  const AdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Image.asset('assets/images/aviz_logo.png'),
        ),
        backgroundColor: Colors.white,
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            const SliverPadding(padding: EdgeInsets.only(top: 24)),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text('آویز های داغ', style: Style.grey700_16px_700w),
                    Spacer(),
                    Text('مشاهده همه', style: Style.grey400_14px_400w),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 324,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, value) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 24, left: 8, right: 8, bottom: 32),
                        child: HotAdsCard(
                          image: Image.asset('assets/images/ad_image1.png'),
                          title: 'ویلا ۵۰۰ متری زیر قیمت',
                          caption:
                              'ویو عالی، سند تک برگ، سال ساخت ۱۴۰۲، تحویل فوری',
                          price: '۲۵٬۶۸۳٬۰۰۰٬۰۰۰',
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: AdDetailsScreen(),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    }),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
                child: Row(
                  children: [
                    Text('آویز های اخیر', style: Style.grey700_16px_700w),
                    Spacer(),
                    Text('مشاهده همه', style: Style.grey400_14px_400w),
                  ],
                ),
              ),
            ),
            SliverList.builder(itemBuilder: (context, value) {
              return RecentAdsCard(
                image: Image.asset('assets/images/ad_image2.png'),
                title: 'واحد دوبلکس فول امکانات',
                caption: 'سال ساخت ۱۳۹۸، سند تک برگ، دوبلکس تجهیزات کامل',
                price: '۸٬۲۰۰٬۰۰۰٬۰۰۰',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const Directionality(
                          textDirection: TextDirection.rtl,
                          child: AdDetailsScreen(),
                        );
                      },
                    ),
                  );
                },
              );
            })
          ],
        ));
  }
}
