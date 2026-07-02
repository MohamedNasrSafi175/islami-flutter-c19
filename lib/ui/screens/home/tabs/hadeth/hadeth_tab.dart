import 'package:flutter/material.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color(0xffD9EAD3),
      child: Center(
        child: Text(
          'Hadeth',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
