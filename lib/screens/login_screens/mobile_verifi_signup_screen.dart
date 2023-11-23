import 'package:aviz/screens/main_screen.dart';
import 'package:aviz/themes/text_style.dart';
import 'package:aviz/widgets/custom_textfield_register_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MobileVerifiSignUpScreen extends StatelessWidget {
  const MobileVerifiSignUpScreen({super.key});

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
            const Text(
              'تایید شماره موبایل',
              style: Style.grey700_16px_700w,
            ),
            const SizedBox(height: 16),
            const Text(
              'کد ثبت نام پیامک شده را وارد کنید',
              style: Style.grey500_14px_400w,
            ),
            const SizedBox(height: 32),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextFieldRegisterCode(),
                CustomTextFieldRegisterCode(),
                CustomTextFieldRegisterCode(),
                CustomTextFieldRegisterCode(),
              ],
            ),
            const SizedBox(height: 32),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '00:45',
                  style: Style.grey700_18px_500w,
                ),
                Text(
                  ' ارسال مجدد کد',
                  style: Style.grey700_14px_400w,
                ),
              ],
            ),
            const Spacer(),
            Directionality(
              textDirection: TextDirection.ltr,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const Directionality(
                          textDirection: TextDirection.rtl,
                          child: MainScreen(),
                        );
                      },
                    ),
                  );
                },
                child: const Text(
                  'تایید ثبت نام',
                  style: Style.white_16px_500w,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
