import 'package:aviz/constants/custome_colors.dart';
import 'package:aviz/themes/text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFieldProperties extends StatefulWidget {
  const CustomTextFieldProperties({
    super.key,
    required this.defaultlValue,
    this.controller,
    this.focusNode,
  });
  final int defaultlValue;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  State<CustomTextFieldProperties> createState() =>
      _CustomTextFieldPropertiesState();
}

class _CustomTextFieldPropertiesState extends State<CustomTextFieldProperties> {
  late int inputValue;

  @override
  void initState() {
    super.initState();
    inputValue = widget.defaultlValue;
    widget.controller!.text = '$inputValue';
  }

  void increment() {
    setState(() {
      inputValue++;
      widget.controller!.text = '$inputValue';
    });
  }

  void decrement() {
    if (inputValue > 0) {
      setState(() {
        inputValue--;
        widget.controller!.text = '$inputValue';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: CustomColors.grey200, borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            child: TextField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  inputValue = int.tryParse(value) ?? 0;
                });
              },
              decoration: const InputDecoration(border: InputBorder.none),
              style: Style.grey700_16px_400w,
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  increment();
                },
                child: SizedBox(
                    width: 12,
                    height: 18,
                    child: Image.asset('assets/images/polygon_up.png')),
              ),
              GestureDetector(
                onTap: () {
                  decrement();
                },
                child: SizedBox(
                    width: 12,
                    height: 18,
                    child: Image.asset('assets/images/polygon_down.png')),
              ),
            ],
          )
        ],
      ),
    );
  }
}
