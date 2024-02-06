import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final Color color;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        onPressed: onPressed,
        fillColor: color,
        shape: const StadiumBorder(
          side: BorderSide(
            color: Colors.deepPurple,
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
