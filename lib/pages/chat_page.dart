import 'package:flutter/material.dart';
import 'package:sandesh/Model/ChatModel.dart';
import 'package:sandesh/screens/select_contact_screen.dart';
import 'package:sandesh/utils/color.dart';
import 'package:sandesh/widgets/CustomCard.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  List<ChatModel> chats = [
    ChatModel(
      name: "Developer Mourya", 
      icon: "person.svg", 
      isGroup: false, 
      time: "4:00", 
      currentMessage: "Hi Everyone🙏 !!",
      status: "Last seen yesterday at 5:00"
    ),
    ChatModel(
      name: "Sandesh Employees 2023", 
      icon: "groups.svg", 
      isGroup: true, 
      time: "9:00", 
      currentMessage: "Hi guys on this group",
      status: "Last seen yesterday at 5:00"
    ),
    ChatModel(
      name: "Sandesh CEO", 
      icon: "person.svg", 
      isGroup: false, 
      time: "11:00", 
      currentMessage: "Hello Sandesh..",
      status: "Last seen yesterday at 5:00"
    ),
    ChatModel(
      name: "inetrn sandesh", 
      icon: "person.svg", 
      isGroup: false, 
      time: "20:00", 
      currentMessage: "Welcome to world of Sandesh..",
      status: "Last seen yesterday at 5:00"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index)=>CustomCard(chatModel:chats[index]),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=> const SelectContactScreen() ));
        },
        backgroundColor: secondary,
        elevation: 1.5,
        child: const Icon(Icons.chat,color: Colors.white,),
      ),
    );
  }
}