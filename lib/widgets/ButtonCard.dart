import 'package:flutter/material.dart';


class ButtonCard extends StatelessWidget {
  const ButtonCard({super.key,required this.name, required this.icon});

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: const Color(0xFF25d366),
        child: Icon(icon,color: Colors.white, size: 26,),
      ),
       title: Text(
        name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis
        ),
      ),
    );
  }
}