import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather/stores/weather_store.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  const CustomTextFormFieldWidget({
    Key? key,
    required this.textEditingcontroller,
    required this.valueListenable,
    required this.weatherStore,
    required this.focusNode,
    required this.suffixIcon,
  }) : super(key: key);

  final TextEditingController textEditingcontroller;
  final ValueListenable<TextEditingValue> valueListenable;
  final WeatherStore weatherStore;
  final FocusNode focusNode;
  final Widget? suffixIcon;

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  String? validateSearch(String textFieldValue, FocusNode focusNode) {
    RegExp exp = RegExp(r"[^a-zA-Zа-яёА-ЯЁ ]");
    if (!focusNode.hasFocus) {
      return null;
    }
    if (textFieldValue.isEmpty && focusNode.hasFocus) {
      return "Поле не может быть пустым";
    } else if (textFieldValue.contains(exp)) {
      return "Поле не может содержать специальные символы и цифры";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.valueListenable,
      builder: ((context, value, _) => TextFormField(
            focusNode: widget.focusNode,
            controller: widget.textEditingcontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              suffixIcon: widget.suffixIcon,
              filled: true,
              hintStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w400),
              hintText: "ПОИСК ГОРОДА",
              fillColor: Colors.white70,
              errorText: validateSearch(
                  widget.textEditingcontroller.text, widget.focusNode),
            ),
          )),
    );
  }
}
