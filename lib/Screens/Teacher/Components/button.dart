import 'package:flutter/material.dart';

import '../../constants/strings.dart';

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
            color: AppColors.parentPrimary,
          ),
        ),
      ),
    );
  }
}
