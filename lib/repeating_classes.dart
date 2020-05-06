import 'package:flutter/material.dart';

class ButtonsToGo extends StatelessWidget {
  final String heroTag;
  final Color backgroundColor;
  final String text;
  final Function onTap;

  ButtonsToGo({this.backgroundColor, this.heroTag, this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Hero(
        tag: heroTag,
        child: Material(
          elevation: 5.0,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: onTap,
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              text,
            ),
          ),
        ),
      ),
    );
  }
}


class TextInputField extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;
  final Function onChanged;
  final bool obscureText;

  TextInputField({this.hintText, this.onChanged, this.textInputType, this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: textInputType,
      obscureText: obscureText,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        //hintText: 'Enter your email',
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        hintText: hintText,
        contentPadding:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.lightBlueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}