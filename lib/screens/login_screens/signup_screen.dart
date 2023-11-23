import 'package:aviz/constants/custome_colors.dart';
import 'package:aviz/screens/login_screens/login_screen.dart';
import 'package:aviz/screens/login_screens/mobile_verifi_signup_screen.dart';
import 'package:aviz/themes/text_style.dart';
import 'package:aviz/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 76, right: 16, left: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'خوش اومدی به',
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
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'این فوق العادست که آویزو برای آگهی هات انتخاب کردی!',
              style: Style.grey500_14px_400w,
            ),
            const SizedBox(height: 32),
            const CustomTextField(hintText: 'نام و نام خانوادگی'),
            const SizedBox(height: 24),
            const CustomTextField(
              hintText: 'شماره موبایل',
              keyboardType: TextInputType.phone,
            ),
            const Spacer(),
            Directionality(
              textDirection: TextDirection.ltr,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const Directionality(
                          textDirection: TextDirection.rtl,
                          child: MobileVerifiSignUpScreen(),
                        );
                      },
                    ),
                  );
                },
                label: const Text(
                  'مرحله بعد',
                  style: Style.white_16px_500w,
                ),
                icon: Image.asset('assets/images/arrow_left.png'),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'قبلا ثبت نام کردی؟',
                  style: Style.grey500_14px_400w,
                ),
                InkWell(
                  onTap: () {
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
                  child: const Text(
                    ' ورود',
                    style: Style.baseColor_14px_500w,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
