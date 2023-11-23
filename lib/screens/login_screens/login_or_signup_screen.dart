import 'package:aviz/constants/custome_colors.dart';
import 'package:aviz/screens/login_screens/login_screen.dart';
import 'package:aviz/screens/login_screens/signup_screen.dart';
import 'package:aviz/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LoginOrSignUpScreen extends StatelessWidget {
  const LoginOrSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = PageController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 76),
          SizedBox(
            height: 380,
            child: PageView.builder(
              controller: controller,
              padEnds: true,
              itemCount: 3,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/images/pattern_login_screen.png',
                          scale: 0.8,
                        ),
                        Image.asset('assets/images/login.png')
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'اینجا محل',
                          style: Style.grey700_16px_700w,
                        ),
                        Container(
                          height: 26,
                          width: 64,
                          decoration: BoxDecoration(
                              color: CustomColors.grey200,
                              borderRadius: BorderRadius.circular(4)),
                          child: Image.asset('assets/images/aviz_logo.png'),
                        ),
                        const Text(
                          'آگهی شماست',
                          style: Style.grey700_16px_700w,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 36),
                      child: Text(
                        'در آویز ملک خود را برای فروش،اجاره و رهن آگهی کنید و یا اگر دنبال ملک با مشخصات دلخواه خود هستید آویز ها را ببینید',
                        textAlign: TextAlign.center,
                        style: Style.grey500_14px_400w,
                      ),
                    )
                  ],
                );
              }),
            ),
          ),
          const Spacer(),
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: const ExpandingDotsEffect(
                expansionFactor: 3,
                dotHeight: 6,
                dotWidth: 6,
                activeDotColor: CustomColors.baseColor,
                dotColor: CustomColors.grey300),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, bottom: 22),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: const Text(
                      'ثبت نام',
                      style: Style.white_16px_500w,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const Directionality(
                              textDirection: TextDirection.rtl,
                              child: SignUpScreen(),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 25),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(),
                    child: const Text('ورود', style: Style.baseColor_16px_500w),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const Directionality(
                              textDirection: TextDirection.rtl,
                              child: LoginScreen(),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
