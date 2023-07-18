import 'package:flutter/material.dart';

class ColorTag extends StatelessWidget {
  final String hexString;
  final EdgeInsetsGeometry? margin;

  const ColorTag({
    super.key,
    required this.hexString,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: hexString.toColor(),
      ),
      width: 50,
      height: 20,
    );
  }
}

extension ColorExtension on String {
  toColor() {
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));

    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
