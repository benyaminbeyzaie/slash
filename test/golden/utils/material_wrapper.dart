import 'package:flutter/material.dart';

class MaterialWrapper extends StatelessWidget {
  final Widget child;
  const MaterialWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        body: child,
      ),
    );
  }
}
