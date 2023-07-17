import 'package:flutter/material.dart';

import 'indicator_wrapper.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const IndicatorWrapper(
      details: "/ ooops... there is an error!",
      imagePath: 'assets/error.webp',
    );
  }
}
