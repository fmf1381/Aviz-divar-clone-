import 'package:aviz/constants/custome_colors.dart';
import 'package:aviz/screens/ads_screen.dart';
import 'package:aviz/screens/aviz_add_screens/add_ads_screen.dart';
import 'package:aviz/screens/my_aviz_screen.dart';
import 'package:aviz/search_screen.dart';
import 'package:aviz/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBottomNavigationItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: _selectedBottomNavigationItem,
          onTap: (index) {
            setState(() {
              _selectedBottomNavigationItem = index;
            });
          },
          selectedLabelStyle: Style.baseColor_14px_500w,
          unselectedLabelStyle: Style.grey400_14px_500w,
          selectedItemColor: CustomColors.baseColor,
          unselectedItemColor: CustomColors.grey400,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.tag, color: CustomColors.grey400),
              activeIcon: Icon(Iconsax.tag, color: CustomColors.baseColor),
              label: 'آویز آگهی ها',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.search_normal, color: CustomColors.grey400),
              activeIcon:
                  Icon(Iconsax.search_normal, color: CustomColors.baseColor),
              label: 'جستجو',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.add_circle, color: CustomColors.grey400),
              activeIcon:
                  Icon(Iconsax.add_circle, color: CustomColors.baseColor),
              label: 'افزودن آویز',
            ),
            BottomNavigationBarItem(
                icon: Icon(Iconsax.profile_circle, color: CustomColors.grey400),
                activeIcon:
                    Icon(Iconsax.profile_circle, color: CustomColors.baseColor),
                label: 'آویز من'),
          ],
        ),
        body: IndexedStack(
          index: _selectedBottomNavigationItem,
          children: _getlayout(),
        ));
  }

  List<Widget> _getlayout() {
    return <Widget>[
      const AdsScreen(),
      const SearchScreen(),
      const AddAdsScreen(),
      const MyAvizScreen()
    ];
  }
}
