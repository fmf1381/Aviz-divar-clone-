import 'package:aviz/widgets/category_button.dart';
import 'package:flutter/material.dart';

class GeneralCategoryAdsView extends StatelessWidget {
  const GeneralCategoryAdsView({super.key, this.pageController});
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 8,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CategoryButton(
              text: 'فروش آپارتمان',
              onTap: () {
                pageController!.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
            ),
          );
        }));
  }
}
