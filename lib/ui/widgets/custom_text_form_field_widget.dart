import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  const CustomTextFormFieldWidget({Key? key}) : super(key: key);

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        filled: true,
        hintStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        hintText: "ПОИСК ГОРОДА",
        fillColor: Colors.white70,
      ),
    );
  }
}
