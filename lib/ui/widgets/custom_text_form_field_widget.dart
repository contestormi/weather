import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather/stores/weather_store.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  const CustomTextFormFieldWidget({
    Key? key,
    required this.textEditingController,
    required this.valueListenable,
    required this.weatherStore,
    required this.focusNode,
    required this.suffixIcon,
    required this.connectionData,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final ValueListenable<TextEditingValue> valueListenable;
  final WeatherStore weatherStore;
  final FocusNode focusNode;
  final Widget? suffixIcon;
  final Object? connectionData;

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  bool hasConnection(Object? connectionData) {
    if (connectionData == ConnectivityResult.mobile ||
        connectionData == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  String? validateSearch(String textFieldValue, FocusNode focusNode) {
    RegExp exp = RegExp(r"[^a-zA-Zа-яёА-ЯЁ ]");
    if (!focusNode.hasFocus) {
      return null;
    }
    if (textFieldValue.isEmpty && focusNode.hasFocus) {
      return "The field cannot be empty";
    } else if (textFieldValue.contains(exp)) {
      return "The field cannot contain special characters or numbers";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.valueListenable,
      builder: ((context, value, _) => TextFormField(
            focusNode: widget.focusNode,
            controller: widget.textEditingController,
            decoration: InputDecoration(
              enabled: hasConnection(widget.connectionData),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              suffixIcon: widget.suffixIcon,
              filled: true,
              hintStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w400),
              hintText: hasConnection(widget.connectionData)
                  ? "SEARCH CITY"
                  : "NO INTERNET",
              fillColor: Colors.white70,
              errorText: validateSearch(
                  widget.textEditingController.text, widget.focusNode),
            ),
          )),
    );
  }
}
