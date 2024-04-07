import 'package:flutter/material.dart';

import '../../../components/constant/colors.dart';

class ProfileListItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  void Function()? onTap;
  ProfileListItem(
      {super.key, required this.title, required this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
            border: Border.fromBorderSide(
                BorderSide(color: Colors.grey.shade600, width: 0.3)),
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(255, 21, 21, 21)),
        child: ListTile(
          title: Text(title),
          leading: Icon(
            iconData,
            color: ColorPalette.darkPrimary,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
