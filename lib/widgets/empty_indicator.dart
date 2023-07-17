import 'package:flutter/material.dart';

import 'indicator_wrapper.dart';

class EmptyIndicator extends StatelessWidget {
  const EmptyIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const IndicatorWrapper(
      details: "/ hmmm... this is empty!",
      imagePath: 'assets/empty.webp',
    );
  }
}
