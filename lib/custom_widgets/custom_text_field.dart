import 'package:flutter/material.dart';

import '../constants/string_constant.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(this.callBackFunction);

  Function callBackFunction;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController ctr = TextEditingController();
  bool cross = false;
  String? value;

  dynamic data;
  var news_length;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade100, blurRadius: 3, spreadRadius: 3),
          ],
        ),
        child: TextField(
          controller: ctr,
          onChanged: (change) {
            widget.callBackFunction(change);
            setState(() {
              value = change;
              if (value?.trim() == '' || value == null) {
                cross = false;
              } else {
                cross = true;
              }
            });
          },
          decoration: InputDecoration(
            hintText: StringConstants.search,
            border: OutlineInputBorder(borderSide: BorderSide.none),
            prefixIcon: Icon(Icons.search),
            suffixIcon: cross
                ? IconButton(
                    icon: Icon(Icons.highlight_remove),
                    onPressed: () {
                      ctr.clear();
                      widget.callBackFunction(ctr.text);
                    },
                  )
                : null,
            isDense: true,
          ),
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
      ),
    );
  }
}
