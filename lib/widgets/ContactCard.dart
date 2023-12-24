import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sandesh/Model/ChatModel.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key,required this.contact});

  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.blueGrey[200],
        child: SvgPicture.asset(
          "assets/person.svg" , 
          alignment: Alignment.center, height: 36, width: 36, color: Colors.white
        ),
      ),
       title: Text(
        contact.name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis
        ),
      ),
      subtitle: Text(
        contact.status,
        style: const TextStyle(
          fontSize: 13,
          overflow: TextOverflow.ellipsis
        ),
      )
    );
  }
}