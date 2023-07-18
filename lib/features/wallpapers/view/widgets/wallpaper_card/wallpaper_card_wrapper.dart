import 'package:flutter/material.dart';

class WallpaperCardWrapper extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;

  const WallpaperCardWrapper({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade300,
          ),
          height: double.infinity,
          width: double.infinity,
          child: child,
        ),
      ),
    );
  }
}
