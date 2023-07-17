import 'package:flutter/material.dart';

class IndicatorWrapper extends StatelessWidget {
  final String imagePath;
  final String details;

  const IndicatorWrapper({
    super.key,
    required this.details,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          child: Image(
            image: AssetImage(imagePath),
          ),
        ),
        const SizedBox(height: 20),
        Text(details),
      ],
    );
  }
}
