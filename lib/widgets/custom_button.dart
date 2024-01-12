import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String buttonText;
  final Function() onPressed;

  const CustomButton({super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        onPressed: onPressed,
        fillColor: const Color.fromRGBO(29, 30, 49, 1.0),
        shape: const StadiumBorder(
          side: BorderSide(
            color: Colors.deepPurple,
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
