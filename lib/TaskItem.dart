
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String label;
  final Color color;
  final bool isAdd;
  final IconData? icon;

  const TaskItem({super.key, required this.label, required this.color, this.icon,this.isAdd = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.white), // Display the icon if provided
            const SizedBox(width: 2), // Add some spacing between the icon and the text
          ],
          Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),

          isAdd ? const Icon(Icons.add, color: Colors.grey) : const SizedBox(),
        ],
      ),
    );
  }
}