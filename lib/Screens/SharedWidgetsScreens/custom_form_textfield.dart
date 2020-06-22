import 'package:flutter/material.dart';
import 'package:goshopwooapp/Screens/constants.dart';

class CustomField extends StatelessWidget {
  final String hint;
  final String label;
  final IconData icon;
  final Function customValidate;
  final Function onEditorValidate;
  final Function onChangeValue;
  final bool autoValidate;
  final bool enabled;
  final bool isPassword;
  final bool isEmail;
  final TextEditingController controller;

  CustomField(
      {
        @required this.hint,
        @required this.label,
        @required this.icon,
        this.customValidate  (String value ),
        this.onEditorValidate,
        this.onChangeValue(String value),
        this.autoValidate = true,
        this.enabled = true,
        this.controller,
        this.isEmail = false,
        this.isPassword = false,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword ? true : false,
        enabled: enabled,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        autovalidate: this.autoValidate,
        validator: this.customValidate,
        cursorColor: SMainColor,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          errorStyle: TextStyle(
              color: Colors.red,
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),
          hintStyle: TextStyle(
            fontSize: 15,
            color: SHintLine,
            fontWeight: FontWeight.bold,
          ),
          labelStyle: TextStyle(
            color: SHintLine,
          ),
          prefixIcon: Icon(
            icon,
            color: SMainColor,
          ),
          fillColor: STextField,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        onEditingComplete: this.onEditorValidate,
        onChanged: this.onChangeValue,
      ),

    );
  }
}