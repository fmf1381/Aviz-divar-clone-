import 'dart:async';

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
            const FieldRegisterCodeRow(),
            const SizedBox(height: 32),
            const CodeResendTimer(),
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

class FieldRegisterCodeRow extends StatefulWidget {
  const FieldRegisterCodeRow({
    super.key,
  });

  @override
  State<FieldRegisterCodeRow> createState() => _FieldRegisterCodeRowState();
}

class _FieldRegisterCodeRowState extends State<FieldRegisterCodeRow> {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.length == 1 && i < _controllers.length - 1) {
          _focusNodes[i + 1].requestFocus();
        }
        if (_controllers.last.text.length == 1) {
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
        }
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        4,
        (index) => CustomTextFieldRegisterCode(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
        ),
      ),
    );
  }
}

class CodeResendTimer extends StatefulWidget {
  const CodeResendTimer({
    super.key,
  });

  @override
  State<CodeResendTimer> createState() => _CodeResendTimerState();
}

class _CodeResendTimerState extends State<CodeResendTimer> {
  Timer? timer;
  int start = 45;

  void startTime() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '00:$start',
          style: Style.grey700_18px_500w,
        ),
        InkWell(
          onTap: () {
            if (start == 0) {
              start = 45;
              startTime();
            }
          },
          child: Text(
            ' ارسال مجدد کد',
            style: (start != 0)
                ? Style.grey400_14px_400w
                : Style.grey700_14px_400w,
          ),
        ),
      ],
    );
  }
}
