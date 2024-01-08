import 'package:flutter/material.dart';
import 'package:sandesh/Model/ChatModel.dart';
import 'package:sandesh/screens/home_screen.dart';
import 'package:sandesh/widgets/ButtonCard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late ChatModel sourceChat;
  List<ChatModel> contacts = [
    ChatModel(
      name: "Developer Mourya", 
      icon: "person.svg", 
      isGroup: false, 
      time: "4:00", 
      currentMessage: "Hi Everyone🙏 !!",
      status: "Fullstack developers",
      id:1
    ),
    ChatModel(
      name: "Sandesh Employees 2023", 
      icon: "groups.svg", 
      isGroup: true, 
      time: "9:00", 
      currentMessage: "Hi guys on this group",
      status: "Frontend developer",
      id:2
    ),
    ChatModel(
      name: "Sandesh CEO", 
      icon: "person.svg", 
      isGroup: false, 
      time: "11:00", 
      currentMessage: "Hello Sandesh..",
      status: "developer",
      id:3
    ),
    ChatModel(
      name: "inetrn sandesh", 
      icon: "person.svg", 
      isGroup: false, 
      time: "20:00", 
      currentMessage: "Welcome to world of Sandesh..",
      status: "Backend developer",
      id:4
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (contex, index) => InkWell(
              onTap: () {
                sourceChat = contacts.removeAt(index);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => HomeScreen(
                              chatmodels: contacts,
                              sourchat: sourceChat,
                            )));
              },
              child: ButtonCard(
                name: contacts[index].name,
                icon: Icons.person,
              ),
            )),
    );
  }
}