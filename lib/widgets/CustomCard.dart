import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sandesh/Model/ChatModel.dart';
import 'package:sandesh/screens/individual_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.chatModel, this.sourchat});

  final ChatModel chatModel;
  final ChatModel? sourchat;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context)=>IndividualPage(
            chatModel: chatModel,
            sourchat: sourchat,
          ))
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.blueGrey,
          child: SvgPicture.asset(
             chatModel.isGroup ? "assets/groups.svg" : "assets/person.svg" , 
            alignment: Alignment.center, height: 36, width: 36, color: Colors.white
          ),
        ),
        title: Text(
          chatModel.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis
          ),
        ),
        subtitle: Row(
          children: [
            const Icon(Icons.done_all_rounded, size: 20, color: Colors.blue,),
            const SizedBox(width: 3,),
            Flexible(
              child: Text(
                chatModel.currentMessage,
                style: const TextStyle(
                  fontSize: 13,
                  overflow: TextOverflow.ellipsis
                ),
              ),
            )
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(chatModel.time, style: TextStyle(fontSize: 12),),
            SizedBox(height: 5,),
            CircleAvatar(
              radius: 11,
              backgroundColor: Colors.green,
              child: Text("82",style: TextStyle(color: Colors.white,fontSize: 11),),
            )
          ],
        ),
      ),
    );
  }
}