import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sandesh/Model/ChatModel.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key,required this.contact});

  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children:[
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blueGrey[200],
              child: SvgPicture.asset(
                "assets/person.svg" , 
                alignment: Alignment.center, height: 36, width: 36, color: Colors.white
              ),
            ),

            contact.select ?
              const Positioned(
                bottom: 4,
                right: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.teal,
                  radius: 11,
                  child: Icon(Icons.check, color: Colors.white, size: 18,)
                ),
              )
             :
             Container() 

          ] 
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