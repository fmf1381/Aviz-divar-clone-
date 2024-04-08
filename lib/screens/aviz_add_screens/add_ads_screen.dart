import 'package:aviz/constants/custome_colors.dart';
import 'package:aviz/screens/aviz_add_screens/category_ads_view.dart';
import 'package:aviz/screens/aviz_add_screens/general_category_ads_view.dart';
import 'package:aviz/screens/aviz_add_screens/image_title_ads_select_view.dart';
import 'package:aviz/screens/aviz_add_screens/location_ads_select_view.dart';
import 'package:aviz/screens/aviz_add_screens/register_ads_view.dart';
import 'package:aviz/themes/text_style.dart';
import 'package:flutter/material.dart';

class AddAdsScreen extends StatefulWidget {
  const AddAdsScreen({super.key});

  @override
  State<AddAdsScreen> createState() => _AddAdsScreenState();
}

class _AddAdsScreenState extends State<AddAdsScreen> {
  double progressValue = 0;
  int pageViewValue = 0;
  PageController? pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (pageViewValue == 2)
                  ? const Text('ثبت ', style: Style.grey700_16px_500w)
                  : const Text('دسته بندی ', style: Style.baseColor_16px_500w),
              Image.asset('assets/images/aviz_logotype.png'),
            ],
          ),
          leading: InkWell(
              onTap: () => pageController?.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease),
              child: Image.asset('assets/images/arrow_right.png')),
          actions: [
            InkWell(
              onTap: () {
                pageController!.jumpToPage(0);
              },
              child: Image.asset('assets/images/close_square.png'),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: LinearProgressIndicator(
              backgroundColor: Colors.transparent,
              valueColor: const AlwaysStoppedAnimation(CustomColors.baseColor),
              value: progressValue,
            ),
          ),
        ),
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            setState(() {
              progressValue = ((value) / 10) * 2;
              pageViewValue = value;
            });
          },
          children: [
            GeneralCategoryAdsView(pageController: pageController),
            CategoryAdsView(pageController: pageController),
            RegisterAdsView(pageController: pageController),
            LocationAdsSelectView(pageController: pageController),
            ImageTitleAdsSelectView(pageController: pageController)
          ],
        ));
  }
}
