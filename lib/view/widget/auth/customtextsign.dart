import 'package:flutter/material.dart';

class CustomTextSign extends StatelessWidget {
  final String text;
  final String sign;
  final void Function()? onTap;
  const CustomTextSign({
    super.key,
    required this.text,
    required this.sign,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              sign,
              style: const TextStyle(
                  color: Color(0xffe50014),
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
