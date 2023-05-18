import 'package:flutter/material.dart';

class CalculateWidjet extends StatelessWidget {
  const CalculateWidjet({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 82, 82, 1),
            borderRadius: BorderRadius.circular(12)),
        height: MediaQuery.of(context).size.height * 0.08,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
