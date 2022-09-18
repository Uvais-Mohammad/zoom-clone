import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class HomeIconButton extends StatelessWidget {
  const HomeIconButton({
    Key? key,
    required this.icon,
    required this.text,
    this.backgroundColor = buttonColor,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                size: 35,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(text),
        ],
      ),
    );
  }
}
