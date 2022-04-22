import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  const CustomTextFormFieldWidget({Key? key, required this.controller})
      : super(key: key);

  final TextEditingController controller;

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
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
