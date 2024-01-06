import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sandesh/Model/ChatModel.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({super.key, required this.contact});

  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
      child: Container(
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children:[
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blueGrey[200],
                  child: SvgPicture.asset(
                    "assets/person.svg" , 
                    alignment: Alignment.center, height: 36, width: 36, color: Colors.white
                  ),
                ),
        
                const Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 11,
                      child: Icon(Icons.clear, color: Colors.white, size: 13,)
                    ),
                )
        
              ] 
            ),
            const SizedBox(height: 2,),
            Text(
              contact.name,
              style: const TextStyle(
                fontSize: 12,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}