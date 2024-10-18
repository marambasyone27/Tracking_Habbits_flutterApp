
import 'package:flutter/material.dart';

class CompletedTask extends StatelessWidget {
  final String label;
  final Color color;

  const CompletedTask({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Icon(Icons.check_circle, color: Colors.white),
        ],
      ),
    );
  }
}