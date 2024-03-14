import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.icon,
    this.onpressed,
    this.iconSize = 24,
  });
  final String title;
  final IconData icon;
  final double iconSize;

  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          IconButton(
            icon: Icon(
              icon,
              color: Colors.white,
              size: iconSize,
            ),
            onPressed: onpressed,
          ),
        ],
      ),
    );
  }
}
