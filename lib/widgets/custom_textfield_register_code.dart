import 'package:aviz/constants/custome_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldRegisterCode extends StatefulWidget {
  const CustomTextFieldRegisterCode(
      {super.key, this.controller, this.focusNode});
  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  State<CustomTextFieldRegisterCode> createState() =>
      _CustomTextFieldRegisterCodeState();
}

class _CustomTextFieldRegisterCodeState
    extends State<CustomTextFieldRegisterCode> {
  bool _isFilled = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 74,
      child: TextField(
        controller: widget.controller,
        onChanged: (value) {
          setState(() {
            _isFilled = value.isNotEmpty;
          });
        },
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        maxLength: 1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: '',
          contentPadding: const EdgeInsets.all(12),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: _isFilled ? CustomColors.grey300 : CustomColors.grey200,
        ),
      ),
    );
  }
}
