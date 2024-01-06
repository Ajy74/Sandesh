import 'package:flutter/material.dart';
import 'package:sandesh/Model/ChatModel.dart';
import 'package:sandesh/screens/create_group.dart';
import 'package:sandesh/widgets/ButtonCard.dart';
import 'package:sandesh/widgets/ContactCard.dart';

class SelectContactScreen extends StatefulWidget {
  const SelectContactScreen({super.key});

  @override
  State<SelectContactScreen> createState() => _SelectContactScreenState();
}

class _SelectContactScreenState extends State<SelectContactScreen> {

  List<ChatModel> contacts = [
    ChatModel(
      name: "Developer Mourya", 
      icon: "person.svg", 
      isGroup: false, 
      time: "4:00", 
      currentMessage: "Hi Everyone🙏 !!",
      status: "Fullstack developers"
    ),
    ChatModel(
      name: "Sandesh Employees 2023", 
      icon: "groups.svg", 
      isGroup: true, 
      time: "9:00", 
      currentMessage: "Hi guys on this group",
      status: "Frontend developer"
    ),
    ChatModel(
      name: "Sandesh CEO", 
      icon: "person.svg", 
      isGroup: false, 
      time: "11:00", 
      currentMessage: "Hello Sandesh..",
      status: "developer"
    ),
    ChatModel(
      name: "inetrn sandesh", 
      icon: "person.svg", 
      isGroup: false, 
      time: "20:00", 
      currentMessage: "Welcome to world of Sandesh..",
      status: "Backend developer"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Column(  
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis
              ),
            ),
        
            Text(
              "250 Contacts",
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ),

        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.search),
          ),
          
          PopupMenuButton<String>(
            // color: Colors.white,
            offset: const Offset(0, 10),
            position: PopupMenuPosition.under,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            surfaceTintColor: Colors.white,
            shadowColor: Colors.grey.withOpacity(.23),
            onSelected: (value){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(value.toString()),
                duration: const Duration(seconds: 1),
                action: SnackBarAction(
                  label: 'ACTION',
                  onPressed: () { },
                ),
              ));
            },
            itemBuilder: (BuildContext context){
              return const [
                PopupMenuItem(
                  value: "Invite a friend",
                  child: Text("Invite a friend",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                ),


                PopupMenuItem(
                  value: "Contacts",
                  child: Text("Contacts",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                ),

                PopupMenuItem(
                  value: "Refresh",
                  child: Text("Refresh",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                ),

                PopupMenuItem(
                  value: "Help",
                  child: Text("Help",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                ),

              ];
            }
          )
        ],
      ),

      body: ListView.builder(
        itemCount: contacts.length + 2,
        itemBuilder: (context, index){
          if(index==0){
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (builder)=> const CreateGroupScreen()));
              },
              child: const ButtonCard(icon: Icons.group, name: "New Group",)
            );
          }
          else if(index==1){
            return const ButtonCard(icon: Icons.person_add, name: "New contact",);
          }
          
          return ContactCard(contact: contacts[index-2]);
        },
      ),
    );
  }
}