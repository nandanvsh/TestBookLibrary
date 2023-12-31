import 'package:flutter/material.dart';


class InputTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  InputTextFieldWidget(this.textEditingController, this.hintText);

  Widget build(BuildContext context) {
     return Container(
      height: 46,
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffffffff),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide:
            const BorderSide(width: 0.5),
             borderRadius:
              BorderRadius.circular(12)
              ),
           ),
      ),
    );
  }
}



