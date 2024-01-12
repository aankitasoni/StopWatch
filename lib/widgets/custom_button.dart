import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String buttonText;
  const CustomButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        onPressed: () {},
        // fillColor: Colors.green,
        shape: const StadiumBorder(
          side: BorderSide(
            color: Colors.deepPurple,
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
