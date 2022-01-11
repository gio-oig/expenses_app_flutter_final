import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String content;
  final Function() onPress;
  const CustomButton({Key? key, required this.content, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(content),
      style: ElevatedButton.styleFrom(
        // shape: const CircleBorder(),
        // padding: const EdgeInsets.all(5),
        primary: const Color(0xff267B7B), // <-- Button color
        // onPrimary: Colors.red, // <-- Splash color
      ),
    );
  }
}
