import 'package:aviz/constants/custome_colors.dart';
import 'package:aviz/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('دسته بندی ', style: Style.baseColor_16px_500w),
            Image.asset('assets/images/aviz_logotype.png'),
          ],
        ),
      ),
      body: const SearchBox(),
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
