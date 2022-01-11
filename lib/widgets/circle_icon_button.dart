import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final Icon icon;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final Function() onPress;
  const CircleIconButton({
    Key? key,
    required this.icon,
    this.color = Colors.white,
    required this.onPress,
    this.padding = const EdgeInsets.all(5),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: icon,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: padding,
        primary: const Color(0xff267B7B), // <-- Button color
        // onPrimary: Colors.red, // <-- Splash color
      ),
    );
  }
}
