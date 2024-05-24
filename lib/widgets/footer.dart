import 'package:flutter/material.dart';
import 'package:prohub/constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.maxFinite,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/right.png',
            width: 28,
          ),
          const SizedBox(
              height: 10), // Add some space between the image and text
          const Text(
            "Made by Prohub",
            style: TextStyle(
                fontWeight: FontWeight.w400, color: CustomColor.whiteSecondary),
          ),
        ],
      ),
    );
  }
}
