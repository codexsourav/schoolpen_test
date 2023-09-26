import 'package:flutter/material.dart';

class CircleAvatarButton extends StatelessWidget {
  const CircleAvatarButton({
    super.key,
    required this.iconData,
    required this.onTap,
  });
  final IconData iconData;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            iconData,
            color: const Color(0xff9163d7),
          ),
        ),
      ),
    );
  }
}
