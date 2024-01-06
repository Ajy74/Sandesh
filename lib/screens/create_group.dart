import 'package:flutter/material.dart';
import 'package:sandesh/Model/ChatModel.dart';
import 'package:sandesh/widgets/AvatarCard.dart';
import 'package:sandesh/widgets/ButtonCard.dart';
import 'package:sandesh/widgets/ContactCard.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {

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

  List<ChatModel> groups = [];

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
              "New Group",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis
              ),
            ),
        
            Text(
              "Add participants",
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
          
        ],
      ),

      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: groups.isNotEmpty ? 80 : 0
            ),
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index){          
                return InkWell(
                  onTap: (){
                    if(contacts[index].select == false){
                      setState(() {
                        contacts[index].select = true;
                        groups.add(contacts[index]);
                      });
                    }
                    else{
                      setState(() {
                        contacts[index].select = false;
                        groups.remove(contacts[index]);
                      });
                    }
                  },
                  child: ContactCard(contact: contacts[index])
                );
              },
            ),
          ),

          groups.isNotEmpty ?
          Column(
            children: [
              Container(
                height: 75,
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    if(contacts[index].select == true){
                       return InkWell(
                      onTap: (){
                        setState(() {
                          groups.remove(contacts[index]);
                          contacts[index].select = false;
                        });
                      },
                      child: AvatarCard(contact: contacts[index],)
                     );
                    }
                    return Container();
                  }
                ),
              ),
              Container(height: 1,width: double.maxFinite,color: Colors.grey,)
            ],
          )
          : const SizedBox()
        ],
      ),
    );
  }
}