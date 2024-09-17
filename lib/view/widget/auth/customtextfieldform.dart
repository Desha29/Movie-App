import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labelText;
  final TextEditingController? mycontroller;
  final String? Function(String?)? validate;
  final TextInputType? keyboardType;
  final IconButton? suffix;
  bool isPassword;
  CustomTextFormAuth(
      {super.key,
      required this.hinttext,
      required this.labelText,
      this.mycontroller,
      this.validate,
      this.keyboardType,
      this.suffix,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: TextFormField(
        obscureText: isPassword,
        keyboardType: keyboardType,
        validator: validate,
        cursorColor: Theme.of(context).textTheme.bodySmall!.color,
        style: TextStyle(fontSize: 18, color:Theme.of(context).textTheme.bodySmall!.color),
        controller: mycontroller,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelStyle:  TextStyle(
              color: Theme.of(context).textTheme.bodySmall!.color,
              fontSize: 25,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(labelText)),
            hintText: hinttext,
            suffixIcon: suffix,
            labelStyle:  TextStyle(fontSize: 22, color: Theme.of(context).textTheme.labelLarge!.color),
            hintStyle: const TextStyle(fontSize: 14)),
      ),
    );
  }
}
