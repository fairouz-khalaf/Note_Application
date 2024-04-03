import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.text, required this.icon, this.onPressed});
  final String text;
  final IconData icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const Spacer(),
        CustomIcon(
          icon: icon,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
